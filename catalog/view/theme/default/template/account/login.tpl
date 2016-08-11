<?php echo $header; ?>

	<!-- content -->
	<main>
		<!-- container -->
		<div class="container">
			<!-- content-top -->
			<div class="section content-top">
				<!-- breadcrumbs -->
                <?php require_once DIR_TEMPLATE . 'default/template/common/breadcrumbs.tpl'; ?>
				<!-- breadcrumbs end -->
			</div>
			<!-- content-top end -->

				<!-- block-account -->
				<div class="section block-account">
					<div class="row">
						<div class="col s12 m6">
							<!-- account-auth -->
							<div class="account-auth">
								<h1>Вход на сайт Simsilk</h1>
								<form id="form-account-login">
									<div class="input-field"> <i class="material-icons prefix">account_circle</i> <input name="account_auth_name" type="text" placeholder="E-mail" /> </div>
									<div class="input-field"> <i class="material-icons prefix">lock_outline</i> <input name="account_auth_password" type="password" placeholder="Пароль" /> </div>
									<div class="row account-auth__prebuttons">
										<div class="col s6 right-align"> <input type="checkbox" class="filled-in" id="account_auth_remember" checked="checked" /> <label for="account_auth_remember">Запомнить меня</label> </div>
										<div class="col s6 left-align"> <a href="<?php echo $forgotten; ?>">Забыли пароль?</a> </div>
									</div>
									<div class="account-auth__buttons center-align"> <button class="btn-large btn-orange btn-orange--bold waves-effect waves-light" type="submit" name="action">Войти</button> </div>
								</form>
							</div>
							<!-- account-auth end -->
						</div>
						<div class="col s12 m6">
							<!-- account-auth-social -->
							<div class="account-auth-social">
								<h2>Войти на сайт с помощью:</h2>

                                <script src="//ulogin.ru/js/ulogin.js"></script>
                                <div id="uLogin" data-ulogin="display=panel;theme=classic;fields=email,first_name,last_name;providers=vkontakte,facebook,odnoklassniki;hidden=;redirect_uri=index.php%3Froute%3Dcommon%2Fquicksignup%2Flogin2;mobilebuttons=0;"></div>

							</div>
							<!-- account-auth-social end -->
						</div>
					</div>
				</div>
				<!-- block-account end -->

		</div>
		<!-- container end -->
	</main>
	<!-- MAIN CONTENT [END] -->

<?php echo $footer; ?>

<?php /*

      <div class="row">
        <div class="col-sm-6">
          <div class="well">
            <h2><?php echo $text_new_customer; ?></h2>
            <p><strong><?php echo $text_register; ?></strong></p>
            <p><?php echo $text_register_account; ?></p>
            <a href="<?php echo $register; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
        </div>
        <div class="col-sm-6">
          <div class="well">
            <h2><?php echo $text_returning_customer; ?></h2>
            <p><strong><?php echo $text_i_am_returning_customer; ?></strong></p>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
              <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
              <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </form>
          </div>
        </div>
      </div>
*/ ?>