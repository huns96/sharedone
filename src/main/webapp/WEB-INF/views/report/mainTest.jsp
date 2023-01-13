<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<style>
    body{
        background-color: lightgray;
    }

    tr > .table-head{
        text-align: center;
        background-color:lightgray;
    }

    tbody .row-head{
        text-align:center;
    }

    tr > .td-body{
        text-align: center;
    }
</style>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <my:Sidebar></my:Sidebar>
        <div class="col py-3">
<div class="">
    <div class="p-3 mt-3 mb-3" style="background-color: white;">
        서치바 기호에 맞게
    </div>

    <div style="height: 300px; background-color:white;" class="mb-5">
        <div class="row p-2 justify-content-between">
            <div class="col-4"><h5 style="font-weight: bold;">주문 목록</h5></div>
            <div class="col-1" style="float: right; text-align: center;"><button class="btn btn-danger">새 주문 등록</button></div>
        </div>
        <div>
            <table class="table table-bordered border border-5">
                <thead><!-- table 기호에 맞게 -->
                <tr> <!-- 데이터 받으면 그때 for문 -->
                    <th scope="col" class="table-head">#</th>
                    <th scope="col" class="table-head">주문코드</th>
                    <th scope="col" class="table-head">주문코드</th>
                    <th scope="col" class="table-head">주문코드</th>
                    <th scope="col" class="table-head">주문코드</th>
                    <th scope="col" class="table-head">주문코드</th>
                    <th scope="col" class="table-head">주문코드</th>
                    <th scope="col" class="table-head">주문코드</th>
                    <th scope="col" class="table-head" style="width: 7%;">주문코드</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row" class="row-head">1</th>
                    <td class="td-body">Mark</td>
                    <td class="td-body">Otto</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td>
                        <div class="d-flex justify-content-center">
                            <button class="btn btn-warning btn-sm" style="margin-right: 5px; color: white;">수정</button>
                            <button class="btn btn-dark btn-sm">X</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="row-head">2</th>
                    <td class="td-body">Mark</td>
                    <td class="td-body">Otto</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td>
                        <div class="d-flex justify-content-center">
                            <button class="btn btn-warning btn-sm" style="margin-right: 5px; color: white;">수정</button>
                            <button class="btn btn-dark btn-sm">X</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="row-head">3</th>
                    <td class="td-body">Mark</td>
                    <td class="td-body">Otto</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td>
                        <div class="d-flex justify-content-center">
                            <button class="btn btn-warning btn-sm" style="margin-right: 5px; color: white;">수정</button>
                            <button class="btn btn-dark btn-sm">X</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="row-head">4</th>
                    <td class="td-body">Mark</td>
                    <td class="td-body">Otto</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td>
                        <div class="d-flex justify-content-center">
                            <button class="btn btn-warning btn-sm" style="margin-right: 5px; color: white;">수정</button>
                            <button class="btn btn-dark btn-sm">X</button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div style="height: 300px; background-color:white;">
        <div class="row p-2">
            <div class="col-4"><h5 style="font-weight: bold;">주문 상품 목록</h5></div>
        </div>
        <div>
            <table class="table table-bordered border border-5">
                <thead>
                <tr>
                    <th scope="col" class="table-head">#</th>
                    <th scope="col" class="table-head">주문코드</th>
                    <th scope="col" class="table-head">주문코드</th>
                    <th scope="col" class="table-head">주문코드</th>
                    <th scope="col" class="table-head">주문코드</th>
                    <th scope="col" class="table-head">주문코드</th>
                    <th scope="col" class="table-head">주문코드</th>
                    <th scope="col" class="table-head">주문코드</th>
                    <th scope="col" class="table-head" style="width: 7%;">주문코드</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row" class="row-head">1</th>
                    <td class="td-body">Mark</td>
                    <td class="td-body">Otto</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td>
                        <div class="d-flex justify-content-center">
                            <button class="btn btn-warning btn-sm" style="margin-right: 5px; color: white;">수정</button>
                            <button class="btn btn-dark btn-sm">X</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="row-head">2</th>
                    <td class="td-body">Mark</td>
                    <td class="td-body">Otto</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td>
                        <div class="d-flex justify-content-center">
                            <button class="btn btn-warning btn-sm" style="margin-right: 5px; color: white;">수정</button>
                            <button class="btn btn-dark btn-sm">X</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="row-head">3</th>
                    <td class="td-body">Mark</td>
                    <td class="td-body">Otto</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td>
                        <div class="d-flex justify-content-center">
                            <button class="btn btn-warning btn-sm" style="margin-right: 5px; color: white;">수정</button>
                            <button class="btn btn-dark btn-sm">X</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="row-head">4</th>
                    <td class="td-body">Mark</td>
                    <td class="td-body">Otto</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td class="td-body">@mdo</td>
                    <td>
                        <div class="d-flex justify-content-center">
                            <button class="btn btn-warning btn-sm" style="margin-right: 5px; color: white;">수정</button>
                            <button class="btn btn-dark btn-sm">X</button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>