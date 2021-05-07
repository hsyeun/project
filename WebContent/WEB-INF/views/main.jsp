<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>MONO Artfair</title>
<link rel="stylesheet" type="text/css" href="/moa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/moa/css/user.css">
<script type="text/javascript" src="/moa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/moa/js/w3color.js"></script>
<style type="text/css"></style>

<script type="text/javascript">
/* 	$(function(){
		$('#board').click(function(){
			$(location).attr('href', '/moa/member/join.moa')
		});
	}); */
</script>

</head>
<body>
	
<!-- Top Header Bar -->
<header class="top-header-bar-container">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<ul class="top-header-bar">
					<!-- Email -->
					<li class="top-email">
						<i class="fa fa-envelope-o"></i> <!-- <?php echo esc_html( get_theme_mod( 'tyche_top_bar_email', get_option( 'admin_email' ) ) ); ?> -->
					</li>
					<!-- / Email -->
					<!-- <!-- <?php if ( class_exists( 'WooCommerce' ) ) : ?> -->
						<!-- Cart -->
						<li class="top-cart">
							<a href="<!-- <?php echo esc_url( Tyche_Helper::get_woocommerge_page( 'cart' ) ); ?> -->"><i class="fa fa-shopping-cart"></i> <!-- <?php echo esc_html__( 'My Cart', 'tyche' ); ?> -->
								<!-- <?php echo esc_html( get_woocommerce_currency_symbol( get_woocommerce_currency() ) ) . ' <span class="price">' . esc_html( Tyche_WooCommerce_Hooks::get_cart_total() ) . '</span>'; ?> -->
							</a>
						</li> <!-- / Cart -->
					<!-- <!-- <?php endif; ?> -->

					<!-- <?php if ( class_exists( 'WooCommerce' ) ) : ?> -->
						<!-- Account -->
						<li class="top-account">
							<a href="<!-- <?php echo esc_url( Tyche_Helper::get_woocommerge_page( 'account' ) ); ?> -->"><i class="fa fa-user"></i> <!-- <?php echo esc_html__( 'Account', 'tyche' ); ?> -->
							</a>
						</li><!-- / Account -->
					<!-- <?php endif; ?> -->

					<!-- <?php if ( function_exists( 'pll_the_languages' ) ) : ?> -->
						<!-- Multi language picker -->
						<li class="top-multilang">
							<!-- <?php
							$current_lang = pll_current_language( 'name' );
							$current_flag = pll_current_language( 'flag' );
							?> -->
							<a href="#" class="multilang-toggle" id="multilang-toggle"> <!-- <?php echo $current_flag . esc_html( $current_lang ); ?> --> </a>
							<ul class="tyche-multilang-menu" data-menu data-menu-toggle="#multilang-toggle">
								<!-- <?php
								$args = array(
									'show_flags' => 1,
									'show_names' => 1,
								);

								pll_the_languages( $args );
								?> -->
							</ul>
						</li><!-- / Multi language picker -->
					<!-- <?php endif; ?> -->
					<!-- <?php
					$enable_search_bar = get_theme_mod( 'tyche_enable_top_bar_search', 'enabled' );
					?> -->
					<!-- <?php if ( 'enabled' === $enable_search_bar ) : ?> -->
						<!-- Top Search -->
						<li class="top-search">
							<!-- Search Form -->
							<form role="search" method="get" class="pull-right" id="searchform_topbar" action="<!-- <?php echo esc_url( home_url( '/' ) ); ?> -->">
								<label>
									<span class="screen-reader-text"><!-- <?php esc_html__( 'Search for:', 'tyche' ); ?> --></span>
									<input class="search-field-top-bar" id="search-field-top-bar" placeholder="<!-- <?php echo esc_attr__( 'Search ...', 'tyche' ); ?> -->" value="" name="s" type="search">
								</label>
								<button id="search-top-bar-submit" type="submit" class="search-top-bar-submit">
									<span class="fa fa-search"></span>
								</button>
							</form>
						</li><!-- / Top Search -->
					<!-- <?php endif; ?> -->
				</ul>
			</div>
		</div>
	</div>
</header><!-- /Top Header Bar -->

<!-- Main Slider -->
<section class="main-slider">
	<!-- <?php if ( empty( $images ) ) : ?> -->
		<div class="owl-carousel owl-theme" id="main-slider">
			<div class="item">
				<img src="<!-- <?php echo get_template_directory_uri(); ?> -->/assets/images/hero.jpg"/>
				<div class="hero-caption left hidden-xs hidden-sm">
					<span class="year"><!-- <?php echo esc_html( date( 'Y' ) ); ?> --></span>
					<span class="caption"><!-- <?php echo esc_html__( 'Autumn Collection', 'tyche' ); ?> --></span>
					<div class="btn-group">
						<a href="#"><!-- <?php echo esc_html__( 'Shop Now', 'tyche' ); ?> --></a>
						<a href="#"><!-- <?php echo esc_html__( 'Learn More', 'tyche' ); ?> --></a>
					</div>
				</div>
			</div>
		</div>
	<!-- <?php else : ?> -->
		<div class="owl-carousel owl-theme" id="main-slider">
			<!-- <?php foreach ( $images as $image ) : ?> -->
				<div class="item">
					<!-- <?php echo wp_get_attachment_image( $image['image_bg'], 'tyche-slider-image' ); ?> -->
					<div class="hero-caption <!-- <?php echo esc_attr( get_theme_mod( 'tyche_slider_layout', 'left' ) ); ?> --> hidden-xs hidden-sm">
						<!-- <?php if ( ! empty( $image['cta_text'] ) ) : ?> -->
							<span class="year"><!-- <?php echo esc_html( $image['cta_text'] ); ?> --></span>
						<!-- <?php endif; ?> -->
						<!-- <?php if ( ! empty( $image['cta_subtext'] ) ) : ?> -->
							<span class="caption"><!-- <?php echo esc_html( $image['cta_subtext'] ); ?> --></span>
						<!-- <?php endif; ?> -->
						<div class="btn-group">
							<!-- <?php if ( ! empty( $image['button_one_text'] ) && ! empty( $image['button_one_url'] ) ) : ?> -->
								<a href="<!-- <?php echo esc_url( $image['button_one_url'] ); ?> -->"><!-- <?php echo esc_html( $image['button_one_text'] ); ?> --></a>
							<!-- <?php endif; ?> -->
							<!-- <?php if ( ! empty( $image['button_two_text'] ) && ! empty( $image['button_two_url'] ) ) : ?> -->
								<a href="<!-- <?php echo esc_url( $image['button_two_url'] ); ?> -->"><!-- <?php echo esc_html( $image['button_two_text'] ); ?> --></a>
							<!-- <?php endif; ?> -->
						</div>
					</div>
				</div>
			<!-- <?php endforeach; ?> -->
		</div>
	<!-- <?php endif; ?> -->
	<div class="main-slider-bar hidden-xs">
		<div class="container">
			<ul class="main-slider-info">
				<li class="col-sm-4 col-xs-12">
					<div class="main-slider-info-cell">
						<div class="cell-icon">
							<!-- <?php
							$icon = get_theme_mod( 'info_section_one_icon', 'store' );
							?> -->
							<i class="dashicons dashicons-<!-- <?php echo esc_attr( $icon ); ?> -->"></i>
						</div>
						<div class="cell-content">
							<span class="cell-caption">
								<!-- <?php echo wp_kses_post( get_theme_mod( 'info_section_one_text', 'FREE SHIPPING' ) ); ?> -->
							</span> <span class="cell-subcaption">
								<!-- <?php echo wp_kses_post( get_theme_mod( 'info_section_one_subtext', 'On all orders over 90$' ) ); ?> -->
							</span>
						</div>
					</div>
				</li>
				<li class="col-sm-4 col-xs-12">
					<div class="main-slider-info-cell">
						<div class="cell-icon">
							<!-- <?php
							$icon = get_theme_mod( 'info_section_two_icon', 'phone' );
							?> -->
							<i class="dashicons dashicons-<!-- <?php echo esc_attr( $icon ); ?> -->"></i>
						</div>
						<div class="cell-content">
							<span class="cell-caption">
								<!-- <?php echo wp_kses_post( get_theme_mod( 'info_section_two_text', 'CALL US ANYTIME' ) ); ?> -->
							</span> <span class="cell-subcaption">
								<!-- <?php echo wp_kses_post( get_theme_mod( 'info_section_two_subtext', '+04786445953' ) ); ?> -->
							</span>
						</div>

					</div>
				</li>
				<li class="col-sm-4 col-xs-12">
					<div class="main-slider-info-cell">
						<div class="cell-icon">
							<!-- <?php
							$icon = get_theme_mod( 'info_section_three_icon', 'location-alt' );
							?> -->
							<i class="dashicons dashicons-<!-- <?php echo esc_attr( $icon ); ?> -->"></i>
						</div>
						<div class="cell-content">
						<span class="cell-caption">
							<!-- <?php echo wp_kses_post( get_theme_mod( 'info_section_three_text', 'OUR LOCATION' ) ); ?> -->
						</span> <span class="cell-subcaption">
							<!-- <?php echo wp_kses_post( get_theme_mod( 'info_section_three_subtext', '557-6308 Lacinia Road. NYC' ) ); ?> -->
						</span>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</section><!-- / Main Slider -->

<footer class="site-copyright">
	<div class="site-info ">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- <?php
					if ( has_nav_menu( 'social' ) ) {

							wp_nav_menu(
								array(
									'theme_location'  => 'social',
									'container'       => 'div',
									'container_id'    => 'menu-social',
									'container_class' => 'menu pull-left',
									'menu_id'         => 'menu-social-items',
									'menu_class'      => 'menu-items',
									'depth'           => 1,
									'link_before'     => '<span class="screen-reader-text">',
									'link_after'      => '</span>',
									'fallback_cb'     => '',
								)
							);
						}
						?> -->

					<div class="copyright-text pull-right">
						<!-- <?php
						echo wp_kses_post(
								get_theme_mod(
									'tyche_copyright_contents',
									vsprintf(
										// Translators: 1 is current year, 2 is separator, 3 is theme link.
										__( 'Copyright &copy; %1$s %2$s %3$s %2$s Powered by WordPress.', 'tyche' ),
										array(
											date_i18n( __( 'Y', 'tyche' ) ),
											'<span class="sep">|</span>',
											sprintf( '<a href="https://colorlib.com/tyche">%s</a>', __( 'Theme: Tyche', 'tyche' ) ),
										)
									)
								)
							);
							?> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</footer><!-- / Copyright -->
</body>
</html>