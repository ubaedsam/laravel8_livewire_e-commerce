<div>
    <style>
        nav svg{
            height: 20px;
        }
        nav .hidden{
            display: block !important;
        }
    </style>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-6">
                                All Coupon
                            </div>
                            <div class="col-md-6">
                                <a href="{{ route('admin.addcoupon') }}" class="btn btn-success pull-right">Tambah Data</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        @if(Session::has('message'))
                            <div class="alert alert-success" role="alert">{{ Session::get('message') }}</div>
                        @endif
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Coupon Code</th>
                                    <th>Coupon Type</th>
                                    <th>Coupon Value</th>
                                    <th>Cart Value</th>
                                    <th>Expiry Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($coupons as $coupon)
                                    <tr>
                                        <td>{{ $coupon->id }}</td>
                                        <td>{{ $coupon->code }}</td>
                                        <td>{{ $coupon->type }}</td>
                                        @if($coupon->type == 'fixed')
                                            <td>Rp. {{ $coupon->value }}</td>
                                        @else
                                            <td>{{ $coupon->value }} %</td>
                                        @endif
                                            <td>Rp. {{ $coupon->cart_value }}</td>
                                        <td>{{ $coupon->expiry_date }}</td>
                                        <td>
                                            <a href="{{ route('admin.editcoupon',['coupon_id'=>$coupon->id]) }}" class="btn btn-xs btn-warning"><i class="fa fa-edit fa-2x"></i></a>
                                            <a href="#" onclick="confirm('Apakah anda yakin ingin menghapus data coupon ini ?') || event.stopImmediatePropagation()" wire:click.prevent="deleteCoupon({{ $coupon->id }})" class="btn btn-xs btn-danger" style="margin-left: 10px;"><i class="fa fa-times fa-2x"></i></a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>