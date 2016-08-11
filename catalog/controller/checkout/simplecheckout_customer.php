<?php
/*
@author	Dmitriy Kubarev
@link	http://www.simpleopencart.com
@link	http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4811
*/

include_once(DIR_SYSTEM . 'library/simple/simple_controller.php');

class ControllerCheckoutSimpleCheckoutCustomer extends SimpleController {
    private $_templateData = array();

    private function init() {
        $this->loadLibrary('simple/simplecheckout');

        $this->simplecheckout = SimpleCheckout::getInstance($this->registry);

        $this->language->load('checkout/simplecheckout');

        $get_route = isset($_GET['route']) ? $_GET['route'] : (isset($_GET['_route_']) ? $_GET['_route_'] : '');

        if ($get_route == 'checkout/simplecheckout_customer') {
            $this->simplecheckout->init('customer');
        }
    }

    public function index() {
        $this->init();

        if ($this->simplecheckout->isBlockHidden('customer')) {
            return;
        }

        $this->_templateData['text_checkout_customer']       = $this->language->get('text_checkout_customer');
        $this->_templateData['text_checkout_customer_login'] = $this->language->get('text_checkout_customer_login');
        $this->_templateData['text_you_will_be_registered']  = $this->language->get('text_you_will_be_registered');
        $this->_templateData['text_account_created']         = $this->language->get('text_account_created');
        $this->_templateData['entry_address_same']           = $this->language->get('entry_address_same');

        $this->_templateData['display_login']               = !$this->customer->isLogged() && $this->simplecheckout->getSettingValue('displayLogin', 'customer');
        $this->_templateData['display_registered']          = !empty($this->session->data['simple']['registered']) ? true : false;

        $this->_templateData['rows'] = $this->simplecheckout->getRows('customer');

        $this->_templateData['rows'][1] = '
            <tr>
                <td class="simplecheckout-table-form-right">
                    <div class="input-field">
                        <i class="material-icons prefix">account_circle</i>
                        <input type="text" name="customer[firstname]" id="customer_firstname" value="" placeholder="Ваше имя"  data-reload-payment-form="true">
                        <div class="simplecheckout-rule-group" data-for="customer_firstname">
                            <div style="display:none;" data-for="customer_firstname" data-rule="byLength" class="simplecheckout-error-text simplecheckout-rule" data-length-min="1" data-length-max="32" data-required="true">Имя должно быть от 1 до 32 символов!</div>
                        </div>
                    </div>
                </td>
            </tr>';

        $this->_templateData['rows'][2] = '
            <tr>
                <td class="simplecheckout-table-form-right">
                    <div class="input-field">
                        <i class="material-icons prefix">stay_current_portrait</i>
                        <input type="tel" name="customer[telephone]" id="customer_telephone" value="" placeholder="+7 (___) ___-__-__"  data-reload-payment-form="true">
                        <div class="simplecheckout-rule-group" data-for="customer_telephone">
                            <div style="display:none;" data-for="customer_telephone" data-rule="byLength" class="simplecheckout-error-text simplecheckout-rule" data-length-min="3" data-length-max="32" data-required="true">Телефон должен быть от 3 до 32 символов!</div>
                        </div>
                    </div>
                </td>
            </tr>';

        $this->_templateData['rows'][3] = '
            <tr>
                <td class="simplecheckout-table-form-right">
                    <div class="input-field">
                        <i class="material-icons prefix">email</i>
                        <input type="email" name="customer[email]" id="customer_email" value="" placeholder="E-mail"  data-reload-payment-form="true">
                        <div class="simplecheckout-rule-group" data-for="customer_email">
                        <div style="display:none;" data-for="customer_email" data-rule="api" class="simplecheckout-error-text simplecheckout-rule" data-method="checkEmailForUniqueness" data-filter="customer_register" data-filter-value="1" data-required="true">Адрес уже зарегистрирован!</div>
                            <div style="display:none;" data-for="customer_email" data-rule="regexp" class="simplecheckout-error-text simplecheckout-rule" data-regexp=".+@.+" data-required="true">Некорректный адрес электронной почты!</div>
                        </div>
                    </div>
                </td>
            </tr>';

        if (!$this->simplecheckout->validateFields('customer')) {
            $this->simplecheckout->addError('customer');
        }

        unset($this->session->data['simple']['registered']);

        $this->_templateData['display_header']              = $this->simplecheckout->getSettingValue('displayHeader', 'customer');
        $this->_templateData['display_you_will_registered'] = !$this->customer->isLogged() && $this->simplecheckout->getSettingValue('displayYouWillRegistered', 'customer') && $this->session->data['simple']['customer']['register'] && !$this->simplecheckout->isFieldUsed('register', 'customer');
        $this->_templateData['display_error']               = $this->simplecheckout->displayError('customer');
        $this->_templateData['has_error']                   = $this->simplecheckout->hasError('customer');
        $this->_templateData['hide']                        = $this->simplecheckout->isBlockHidden('customer');

        $this->setOutputContent($this->renderPage('checkout/simplecheckout_customer', $this->_templateData));
    }

    public function update_session() {
        $this->init();

        $version = $this->simplecheckout->getOpencartVersion();

        $customer = $this->session->data['simple']['customer'];
        if ($version >= 200) {
            $this->session->data['customer'] = $customer;
        }

        if (!$this->customer->isLogged()) {
            foreach ($customer as $key => $value) {
                if ($key == 'register') {
                    continue;
                }

                $this->session->data['guest'][$key] = $value;
            }
        }
    }
}
?>