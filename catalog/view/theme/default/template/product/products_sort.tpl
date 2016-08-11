<div class="products__sort">
    <div class="row">
	    <div class="col s12 m3">
		    <div class="items-view"> <span>Вид:</span>
			    <ul class="items-view-list">
				    <li class="active"><a href="#"><i class="material-icons">view_module</i></a></li>
					<li><a href="#" class="js-view-tile2"><span class="icon-tile-gray"></span></a></li>
					<li><a href="#" class="js-view-lines"><i class="material-icons">view_list</i></a></li>
				</ul>
			</div>
		</div>

	    <div class="col s5 m6">
		    <div class="sortby"> <span>Сортировать по:</span>
			    <ul class="sortby-list">
                    <?php foreach ($sorts as $sort) { ?>
				        <li><a href="<?php echo $sort['href']; ?>"><?php echo $sort['text']; ?></a> <?php echo $sort['order']; ?></li>
                    <?php } ?>
				</ul>
			</div>
	    </div>

	    <div class="col s7 m3">
		    <div class="items-count"> <span>На странице:</span>
                <select id="input-limit" class="form-control" onchange="location = this.value;">
                    <?php foreach ($limits as $limits) { ?>
                        <?php if ($limits['value'] == $limit) { ?>
                            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                        <?php } else { ?>
                            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                        <?php } ?>
                    <?php } ?>
                </select>
            </div>
		</div>
	</div>
</div>
