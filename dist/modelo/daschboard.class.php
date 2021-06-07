 




  <?php 

  class Daschboard {

	private $pdo;

	public function __construct( ) {

		//conexão banco de dados

		$this -> pdo = new PDO("mysql:dbname=sus;host=localhost","root","F@bio102030");
	
		}

		


	public function adicionar ($ubs_cod_ubs,$usuario_cod_user,$medico_cod_medico,
								$especialidade_cod_especialidade,$data_agendamento,$hora_agendamento,
								$num_fichas,$status_agenda) {

			//if($this->verificaCod($usuario_cod_user) == false) {
					$sql = $this->pdo->prepare("INSERT INTO agenda_ubs SET ubs_cod_ubs=:ubs_cod_ubs,
												usuario_cod_user=:usuario_cod_user,medico_cod_medico=:medico_cod_medico,
												especialidade_cod_especialidade=:especialidade_cod_especialidade,data_agendamento=:data_agendamento,
												hora_agendamento=:hora_agendamento,num_fichas=:num_fichas,status_agenda=:status_agenda
					");
					

					$sql->bindParam(":ubs_cod_ubs",$ubs_cod_ubs);
					$sql->bindParam(":usuario_cod_user",$usuario_cod_user);
					$sql->bindParam(":medico_cod_medico",$medico_cod_medico);
					$sql->bindParam(":especialidade_cod_especialidade",$especialidade_cod_especialidade);
					$sql->bindParam(":data_agendamento",$data_agendamento);
					$sql->bindParam(":hora_agendamento",$hora_agendamento);
					$sql->bindParam(":num_fichas",$num_fichas);
					$sql->bindParam(":status_agenda",$status_agenda);
					
					$sql->execute();
			
				print '<div class="alert alert-success" role="alert">
						Agendamento Inserido Com Sucesso!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-agendamento.php\';}, 2000);</script>';

				

				}

			

				
			
				




				public function select (){

					$sql = "
				
						select  user.nome_user AS 'nome do medico',
								u.cod_ubs, u.bairro_ubs,e.nome_especialidade,
								u.nome_ubs AS 'lOCAL DE ATENDIMENTO', m.cod_medico,a.hora_agendamento,
						        a.data_agendamento,a.num_fichas
						from
								medico m 
						inner join medico_atende_ubs me on m.cod_medico = me.medico_cod_medico
						inner join ubs u on u.cod_ubs = me.ubs_cod_ubs
						inner join especialidade_compoe_medico espec on m.cod_medico = espec.medico_cod_medico
						inner join especialidade e on e.cod_especialidade = espec.especialidade_cod_especialidade

						inner join usuario user on  user.cod_user = m.usuario_cod_user
						inner join agenda_ubs a on user.cod_user = a.usuario_cod_user

							where cod_ubs='1' AND status_agenda ='A'
							;

						";
						

 		 					$sql = $this->pdo->query($sql);

							if ($sql->rowCount() > 0) {

								//retorna todos os medicos
								return $sql ->fetchAll();

							}else {
								return array();
							}
					
					

							


				}


			
	}