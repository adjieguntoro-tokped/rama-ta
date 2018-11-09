
<div class="row">
  <div class="col-lg-12">
    <div class="card m-b-30">
        <div class="card-body">

            <h4 class="mt-0 header-title">Data Peserta Seminar</h4>
            <p class="text-muted m-b-30 font-14">Data peserta.</p>

            <table class="table">
                <thead>
                <tr>
                    <!-- <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th> -->
                    @foreach($tableHead as $head)
                      <th>{{ $head }}</th>                    
                    @endforeach
                </tr>
                </thead>
                <tbody>
                  @foreach($dataPeserta as $peserta)
                  <tr>
                    <th scope="row">{{ $peserta->id }}</th>
                    <td>{{ $peserta->nama_peserta }}</td>
                    <td>{{ $peserta->nim_peserta }}</td>
                    <td>{{ $peserta->kelas_peserta }}</td>
                    <td>{{ $peserta->telp_peserta }}</td>
                    <td>{{ $peserta->tema_seminar }}</td>                    
                    <td> <span class="badge badge-{{ ($peserta->kehadiran_peserta == 1) ? 'info' : 'danger' }}">
                          {{ ($peserta->kehadiran_peserta == 1) ? 'Hadir' : 'Tidak Hadir' }} 
                        <span>    
                    </td>                    
                  </tr>
                  @endforeach
                </tbody>
            </table>
            <nav aria-label="...">
                {{ $dataPeserta->links() }}
                <!-- <ul class="pagination">
                    <li class="page-item ">
                    
                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul> -->
            </nav>
        </div>
    </div>
  </div> <!-- end col -->
</div>