<?php if (!$ajax && !$popup && !$as_module) { ?>
<?php $simple_page = 'simpleregister'; include $simple_header; ?>

<div class="simple-content section block-account block-account--reg">
<?php } ?>
    <?php if (!$ajax || ($ajax && $popup)) { ?>
    <script type="text/javascript">
    (function($) {
    <?php if (!$popup && !$ajax) { ?>
        $(function(){
    <?php } ?>
            if (typeof Simplepage === "function") {
                var simplepage = new Simplepage({
                    additionalParams: "<?php echo $additional_params ?>",
                    additionalPath: "<?php echo $additional_path ?>",
                    mainUrl: "<?php echo $action; ?>",
                    mainContainer: "#simplepage_form",
                    useAutocomplete: <?php echo $use_autocomplete ? 1 : 0 ?>,
                    useGoogleApi: <?php echo $use_google_api ? 1 : 0 ?>,
                    scrollToError: <?php echo $scroll_to_error ? 1 : 0 ?>,
                    javascriptCallback: function() {<?php echo $javascript_callback ?>}
                });

                simplepage.init();
            }
    <?php if (!$popup && !$ajax) { ?>
        });
    <?php } ?>
    })(jQuery || $);
    </script>
    <?php } ?>

					<div class="row">
						<div class="col s12 m6">
							<!-- account-reg -->
							<div class="account-reg">
								<h1>Регистрация на сайте Simsilk</h1>

                                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="simplepage_form">
                                    <div class="simpleregister" id="simpleregister">
                                        <div class="simpleregister-block-content">
                                            <?php foreach ($rows as $row) { ?>
                                              <?php echo $row ?>
                                            <?php } ?>
                                            <?php foreach ($hidden_rows as $row) { ?>
                                              <?php echo $row ?>
                                            <?php } ?>
                                        </div>
                                    </div>

									<div class="account-reg__buttons center-align">
                                        <a data-onclick="submit" id="simpleregister_button_confirm" class="btn-large btn-orange bold waves-effect waves-light" type="submit" name="action">Регистрация</a>
                                    </div>

                                    <?php if ($redirect) { ?>
                                        <script type="text/javascript">
                                            location = "<?php echo $redirect ?>";
                                        </script>
                                    <?php } ?>
                                </form>
							</div>
							<!-- account-reg end -->
						</div>
						<div class="col s12 m6">
							<!-- account-auth-social -->
							<div class="account-auth-social">
								<h2>Войти на сайт с помощью:</h2>
								<ul class="social-list">
									<li>
										<a href="#" class="icon-vk-round"></a>
									</li>
									<li>
										<a href="#" class="icon-fb-round"></a>
									</li>
									<li>
										<a href="#" class="icon-odn-round"></a>
									</li>
								</ul>
							</div>
							<!-- account-auth-social end -->
							<!-- account-auth -->
							<div class="account-auth">
								<form id="form-account-login">
									<div class="input-field"> <i class="material-icons prefix">account_circle</i> <input name="account_auth_name" type="text" placeholder="E-mail" /> </div>
									<div class="input-field"> <i class="material-icons prefix">lock_outline</i> <input name="account_auth_password" type="password" placeholder="Пароль" /> </div>
									<div class="row account-auth__prebuttons">
										<div class="col s6 right-align"> <input type="checkbox" class="filled-in" name="account_auth_remember" id="account_auth_remember" checked="checked" /> <label for="account_auth_remember">Запомнить меня</label> </div>
										<div class="col s6 left-align"> <a href="<?php echo $forgotten; ?>">Забыли пароль?</a> </div>
									</div>
									<div class="account-auth__buttons center-align"> <button class="btn-large btn-orange btn-orange--bold waves-effect waves-light" type="submit" name="action">Войти</button> </div>
								</form>
							</div>
							<!-- account-auth end -->
						</div>
					</div>
				</div>
				<!-- block-account end -->


<?php if (!$ajax && !$popup && !$as_module) { ?>
</div>
<?php include $simple_footer ?>
<?php } ?>