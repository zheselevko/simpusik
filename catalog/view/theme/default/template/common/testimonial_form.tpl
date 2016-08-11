	<!-- modal-testimonial -->
	<div id="modal-testimonial" class="modal modal-testimonial">
		<div class="modal-header">
			<h2>Оставить отзыв</h2>
		</div>
		<div class="modal-content">
			<div class="modal-testimonial-form">
				<form id="form-testimonial">
                    <input type="hidden" name="leave_review_rating" value="5" />
					<div class="row">
						<div class="col s12 m6">
							<div class="input-field">
								<i class="material-icons prefix">account_circle</i>
								<input name="leave_review_name" type="text" placeholder="Ваше имя" />
							</div>
						</div>
						<div class="col s12 m6">
							<div class="input-field">
								<i class="material-icons prefix">email</i>
								<input name="leave_review_email" type="email" placeholder="E-mail адрес" />
							</div>
						</div>
					</div>
					<div class="row row--textarea">
						<div class="col s12">
							<div class="input-field">
								<textarea name="leave_review_text" placeholder="Текст вашего отзыва" class="materialize-textarea js-textarea-autoresize"></textarea>
							</div>
						</div>
					</div>

					<div class="captcha center-align" style="padding-left: 64px;">
                        <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
					</div>

					<div class="leave-review-form__buttons">
						<button class="btn-large btn-orange bold waves-effect waves-light" type="submit" name="action">Отправить</button>
					</div>
				</form>
			</div>

            <input type="hidden" name="leave_review_rating" value="5"/>
		</div>
		<a href="#" class="modal-close js-modal-close"></a>
	</div>
	<!-- modal-leave-testimonial end -->
