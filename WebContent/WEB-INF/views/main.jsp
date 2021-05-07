<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD

<!DOCTYPE html>
<html lang="en">
    <head>
		<jsp:include page="nav/head.jsp">
			<jsp:param name="root" value="/moa/static" />
		</jsp:include>
    </head>
    
    <body>        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="index.html">Start Bootstrap</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="services.html">Services</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Portfolio</a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                                <a class="dropdown-item" href="portfolio-1-col.html">1 Column Portfolio</a>
                                <a class="dropdown-item" href="portfolio-2-col.html">2 Column Portfolio</a>
                                <a class="dropdown-item" href="portfolio-3-col.html">3 Column Portfolio</a>
                                <a class="dropdown-item" href="portfolio-4-col.html">4 Column Portfolio</a>
                                <a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Blog</a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                                <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
                                <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
                                <a class="dropdown-item" href="blog-post.html">Blog Post</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownPages" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Other Pages</a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
                                <a class="dropdown-item" href="full-width.html">Full Width Page</a>
                                <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
                                <a class="dropdown-item" href="faq.html">FAQ</a>
                                <a class="dropdown-item" href="404.html">404</a>
                                <a class="dropdown-item" href="pricing.html">Pricing Table</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page header-->
        <header>
            <div class="carousel slide" id="carouselExampleIndicators" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li class="active" data-target="#carouselExampleIndicators" data-slide-to="0"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="https://via.placeholder.com/1900x600" alt="..." />
                        <div class="carousel-caption d-none d-md-block">
                            <h3>First Slide</h3>
                            <p>This is a description for the first slide.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://via.placeholder.com/1900x600" alt="..." />
                        <div class="carousel-caption d-none d-md-block">
                            <h3>Second Slide</h3>
                            <p>This is a description for the second slide.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://via.placeholder.com/1900x600" alt="..." />
                        <div class="carousel-caption d-none d-md-block">
                            <h3>Third Slide</h3>
                            <p>This is a description for the third slide.</p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </header>
        <!-- Page Content-->
        <section class="py-5">
            <div class="container">
                <h1 class="mb-4">Welcome to Modern Business</h1>
                <!-- Marketing Icons Section-->
                <div class="row">
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">Card Title</h4>
                            <div class="card-body"><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">Learn More</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">Card Title</h4>
                            <div class="card-body"><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">Learn More</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card h-100">
                            <h4 class="card-header">Card Title</h4>
                            <div class="card-body"><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">Learn More</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <hr class="my-0" />
        <!-- Portfolio Section-->
        <section class="py-5 bg-light">
            <div class="container">
                <h2 class="mb-4">Portfolio Heading</h2>
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="card h-100">
                            <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                            <div class="card-body">
                                <h4 class="card-title"><a href="#!">Project One</a></h4>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="card h-100">
                            <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                            <div class="card-body">
                                <h4 class="card-title"><a href="#!">Project Two</a></h4>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="card h-100">
                            <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                            <div class="card-body">
                                <h4 class="card-title"><a href="#!">Project Three</a></h4>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="card h-100">
                            <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                            <div class="card-body">
                                <h4 class="card-title"><a href="#!">Project Four</a></h4>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="card h-100">
                            <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                            <div class="card-body">
                                <h4 class="card-title"><a href="#!">Project Five</a></h4>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="card h-100">
                            <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                            <div class="card-body">
                                <h4 class="card-title"><a href="#!">Project Six</a></h4>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <hr class="my-0" />
        <!-- Features Section-->
        <section class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <h2 class="mb-4">Modern Business Features</h2>
                        <p>The Modern Business template by Start Bootstrap includes:</p>
                        <ul>
                            <li><strong>Bootstrap 4.6.0</strong></li>
                            <li>jQuery 3.5.1</li>
                            <li>Font Awesome 5.15.3</li>
                            <li>Working PHP contact form with validation</li>
                            <li>Unstyled page elements for easy customization</li>
                        </ul>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
                    </div>
                    <div class="col-lg-6"><img class="img-fluid rounded" src="https://via.placeholder.com/700x450" alt="..." /></div>
                </div>
            </div>
        </section>
        <hr class="my-0" />
        <!-- Call to Action-->
        <aside class="py-5 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-8"><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p></div>
                    <div class="col-md-4"><a class="btn btn-lg btn-secondary btn-block" href="#!">Call to Action</a></div>
                </div>
            </div>
        </aside>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        
        
    </body>
</html>
=======
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
>>>>>>> branch 'branch' of https://github.com/sooyeun-han/project.git
