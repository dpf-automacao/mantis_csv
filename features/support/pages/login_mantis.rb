class Login_Mantis< SitePrism::Page
    
    #Mapeando elementos 
    element :user_name, 'tr.row-1:nth-child(2) > td:nth-child(2) > input:nth-child(1)'
    element :password, 'tr.row-2:nth-child(3) > td:nth-child(2) > input:nth-child(1)'

    #mapeando botão
    element :entrar, '.button'

    #Método Logar no Sistema
    def logar(usuario, senha)
        user_name.set usuario
        password.set senha
        entrar.click
    end
end
    