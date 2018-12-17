Dado("que estou na tela do Mantis") do
    
    visit 'http://issues.corp.stefanini.com'
    @login = Login_Mantis.new
    @login.logar('fdalves', '#Q121l493')

end
  
Quando("aciono os filtros dos projetos") do

    @exportar = Dados_Mantis.new
    @exportar.projeto
    @exportar.filtro_sprint
       
end