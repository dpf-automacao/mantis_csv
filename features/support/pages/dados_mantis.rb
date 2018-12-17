class Dados_Mantis< SitePrism::Page

    #Selecionado Projeto
    def projeto        
        find(:css, 'tr > td.login-info-right > form > select > option:nth-child(3)').click #child(3) -> MINER BUGS
        sleep(2)
        click_link('Ver Casos')
    end

    #Salvando Dados
    def salvar(file, dados)
        local = open(file, "w")
        local.write(dados)
        local.close
    end

    #Capturando o Texto com os Contadores de Bugs
    def contador_bugs
        total = find(:css, '#buglist > tbody > tr:nth-child(1) > td > span:nth-child(1)').text
        valor = total.scan(/\w+/)
        @bug = valor[3]
    end

    #Definindo Filtros e Sprints
    def filtro_sprint

        arquivo = 'mantis.csv'
        bugs = []

        #For each
        (14..16).each do |sprints|

            #Filtro do Projeto
            find(:css, '#custom_field_43_filter').click
            find(:css, "#custom_field_43_filter_target > select > option:nth-child(#{sprints})").click
            
            #Bugs
            find(:id, 'show_category_filter').click
            find(:css, '#show_category_filter_target > select > option:nth-child(2)').click
            click_button 'Aplicar Filtro'
            
            sprint = ("#{sprints-1}")
            internos = ("#{contador_bugs}")
 
            #Bugs do Cliente
            find(:id, 'show_category_filter').click
            find(:css, '#show_category_filter_target > select > option:nth-child(3)').click
            click_button 'Aplicar Filtro'
                                   
            cliente = ("#{contador_bugs}")
            bugs.push("\n#{sprint}")
            bugs.push(internos)
            bugs.push(cliente)
        end

        #Tratando os dados e Salvando no CSV
        dados = "Sprint, Bugs Internos, Bugs Cliente" + bugs.map{ |i| "#{i}"}.join(",")
        salvar(arquivo, dados)
    end
end
