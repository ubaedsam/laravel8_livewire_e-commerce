<div>
    <style>
        nav svg{
            height: 20px;
        }
        nav .hidden{
            display: block !important;
        }
    </style>
    <div class="container" style="padding:30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-4">
                                All Products
                            </div>
                            <div class="col-md-4">
                                <a href="{{ route('admin.addproducts') }}" class="btn btn-success pull-right">Add New</a>
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control" placeholder="Search..." wire:model="searchTerm">
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
                                    <th>Gambar</th>
                                    <th>Nama Produk</th>
                                    <th>Stock</th>
                                    <th>Harga Pasar</th>
                                    <th>Harga Dijual</th>
                                    <th>Kategori</th>
                                    <th>Tanggal</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($products as $product)
                                    <tr>
                                        <td>{{ $product->id }}</td>
                                        <td><img src="{{ asset('assets/images/products') }}/{{ $product->image }}" alt="{{ $product->name }}" width="60"></td>
                                        <td>{{ $product->name }}</td>
                                        <td>{{ $product->stock_status }}</td>
                                        <td>{{ $product->regular_price }}</td>
                                        <td>{{ $product->sale_price }}</td>
                                        <td>{{ $product->category->name }}</td>
                                        <td>{{ $product->created_at }}</td>
                                        <td>
                                            <a href="{{ route('admin.editproducts',['product_slug'=>$product->slug]) }}" class="btn btn-xs btn-warning"><i class="fa fa-edit fa-2x"></i></a>
                                            <a href="#" onclick="confirm('Apakah anda yakin ingin menghapus data produk ini ?') || event.stopImmediatePropagation()" wire:click.prevent="deleteProduct({{ $product->id }})" class="btn btn-xs btn-danger" style="margin-left: 10px;"><i class="fa fa-times fa-2x"></i></a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        {{ $products->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
