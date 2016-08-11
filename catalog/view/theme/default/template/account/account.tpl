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
				<div class="content-top__right-icon right"><span class="icon-book"></span></div>

			</div>
			<!-- content-top end -->

				<!-- block-account -->
				<div class="section block-account">
					<div class="row">
					    <h1>Личный кабинет<?php if (!empty($customer_name)) echo ': ' . $customer_name; ?></h1>

						<div class="col s12 m6">
							<div class="account-auth">

							    <div class="compare-rows">
								    <ul class="compare-rows-list">
                                        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                        <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
								    </ul>
							    </div>


							</div>
						</div>
						<div class="col s12 m6">
						    <div class="account-auth__buttons center-align">
                                <a href="<?php echo $logout; ?>" class="btn-large btn-orange btn-orange--bold waves-effect waves-light" type="button">Выйти</a>
                            </div>
						</div>
					</div>
				</div>
				<!-- block-account end -->

		</div>
		<!-- container end -->
	</main>
	<!-- MAIN CONTENT [END] -->

<?php echo $footer; ?>