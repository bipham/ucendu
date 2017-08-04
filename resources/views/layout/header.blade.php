<?php
/**
 * Created by PhpStorm.
 * User: nobikun1412
 * Date: 12-Jun-17
 * Time: 00:19
 */
?>
<header id="header" class="menu-header header-custom">
    <div class="container">
       <div class="header-top">
            <div class="left-custom pull-left">
            </div>
           <div class="center-class logo-webstite">
               <a href="{{url('/')}}" class="brand-web">
                   <img src="{{url('/public/imgs/original/logo.jpg')}}" alt="Logo" class="img-custom img-logo-website">
               </a>
           </div>
           <div class="right-custom pull-right">
               <ul id="navigation-my-web" class="navigation-custom col-md-12 col-sm-12 hidden-xs">
                   <li class="nav-item">
                       <a class="nav-link" href="{{url('/')}}">ABOUT US</a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="{{url('/readingPost')}}">CONTACT US</a>
                   </li>
               </ul>
           </div>
       </div>
       <div class="header-bottom">
           <div id="main-nav">
               <ul id="main-navigation" class="navigation-custom col-md-12 col-sm-12 hidden-xs">
                   <li class="nav-item">
                       <a class="nav-link" href="{{url('/')}}">Home</a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="{{url('/readingPost')}}">Reading</a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href="#">Progress</a>
                   </li>
               </ul>
           </div>
       </div>
    </div>
</header><!-- /header -->