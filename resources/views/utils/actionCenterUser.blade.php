<?php
/**
 * Created by PhpStorm.
 * User: BiPham
 * Date: 8/9/2017
 * Time: 10:56 PM
 */
?>
<ul class="navbar-nav navbar-custom-header primary-header-custom navbar-info-custom">
        <?php
//        $stockNotiModel = new App\Models\StockNotification();
//        $orderNotiModel = new App\Models\OrderNotification();
//        $stockNotiNoRead = $stockNotiModel->getAllStockNotificationNoRead(Auth::id());
//        $stockNotiNoRead = sizeof($stockNotiNoRead);
//        $orderNotiNoRead = $orderNotiModel->getAllOrderNotificationNoRead(Auth::id());
//        $orderNotiNoRead = sizeof($orderNotiNoRead);
//        $totalMatchNoti = $stockNotiNoRead + $orderNotiNoRead;
//        $readingCommentNotificationModel = new App\Models\ReadingCommentNotification();

        ?>
        <li class="img-avatar-header img-status-header">
            <img alt="{!! Auth::user()->username !!}" src="{!! asset('storage/img/users') !!}/{!! Auth::user()->avatar !!}" class="img-circle img-ava-header">
        </li>
        <li class="notification-status img-status-header">
                <i class="fa fa-globe noti-status img-status-custom" aria-hidden="true"></i>
                <span class="print-number-noti">
                                   {{--@if($totalMatchNoti != 0)--}}
                    <sup class="total-noti">0</sup>
            </span>
                <div id="notifications-container-menu">
                    <div class="notifications-header">
                        <h3 class="title-noti-menu">Thông báo</h3>
                    </div>
                    <div id="notifications-body">

                    </div>
                    <div class="notifications-footer">
                        <h3 class="see-all-notis">Đánh dấu tất cả đã đọc</h3>
                    </div>
                </div>
            </li>
</ul>
