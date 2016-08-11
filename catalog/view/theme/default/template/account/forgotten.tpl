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
								<h1>Забыли пароль?</h1>

                                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
									<div class="input-field"> <i class="material-icons prefix">account_circle</i> <input name="email" type="text" placeholder="E-mail" /> </div>

                                <div class="account-auth__buttons center-align">
                                    <input type="submit" value="<?php echo $button_continue; ?>" class="btn-large btn-orange btn-orange--bold waves-effect waves-light" />
                                </div>
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

