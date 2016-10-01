# README

Projeto blog cultura pop para treinamento Ruby-on-Rails:

1 - Instalar o RVM (gerenciador de versões do Ruby) com Rails

	1.1 Abra o terminal do linux e insira os comandos:

		gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

		\curl -sSL https://get.rvm.io | bash -s stable --rails

	1.2 Após completar a instalação feche e abra novamente o terminal e execute os comandos:
		
		ruby -v (para verificar a versão atual do ruby)
			ruby 2.3.0p0 (2015-12-25 revision 53290) [i686-linux]

		rails -v (para verificar a versão atual do rails)
			Rails 5.0.0.1



* Se algo der errado e não exibir as mensagens abaixo dos comandos repita o passo um
** Acesse https://rvm.io/rvm/install para mais informações
*** Instalar o sublime text
	sudo apt-get install sublime-text


2 - Começar um novo projeto no rails
	
	2.1 Navegue pelo terminal até o diretório que ficará o projeto e digite:

		rails new culturapop

	2.2 Após baixar todas as dependências entre na pasta do projeto pelo terminal

		cd culturapop

	2.3 Inicialize o servidor 

		rails server

	2.4 Abra o navegador e acesse localhost:3000

*Mais informações sobre como começar um novo projeto 
http://guias.rubyonrails.com.br.s3-website-us-east-1.amazonaws.com/getting_started.html

3 - Gerar modelos visões e controllers para o projeto

	3.1 Encerre o servidor
		 ctrl+c (no terminal)

	3.2 Verifique se está no diretório do projeto e insira os comandos no terminal

		rails generate scaffold user name nick email age:integer address:text

		rails generate scaffold post title desc:text user:references

		rails generate scaffold comments desc:text user:references post:references

	3.3 Migrar a base de dados para o banco

		rails db:create		(inicializa o banco)

		rails db:migrate 	(migra a base de dados para o banco)

* Mais informações sobre migrations 
http://guias.rubyonrails.com.br.s3-website-us-east-1.amazonaws.com/migrations.html

4 - Configurar as associações entre modelos
	
	4.1 Abra a pasta do projeto no sublime ou em qualquer outro editor de texto 

	4.2 Em /app/models/user.rb

		class User < ApplicationRecord
		  has_many :posts, dependent: :destroy
		  has_many :comments
		end

	4.3 Em /app/models/post.rb

		class Post < ApplicationRecord
		  belongs_to :user
		  has_many :comments, dependent: :destroy
		end

	4.4 Em /app/models/comment.rb
		
		class Comment < ApplicationRecord
		  belongs_to :user
		  belongs_to :post
		end

* Mais informações sobre associações entre models
	http://guias.rubyonrails.com.br.s3-website-us-east-1.amazonaws.com/association_basics.html


5 - Instalar e configurar o Bootstrap
	5.1 Em /Gemfile insira fora dos groups

	gem 'bootstrap', '~> 4.0.0.alpha4'

	5.2 Digite no terminal:

		bundle install

	5.3 Em /app/assets/stylesheets renomear:
		 
		 application.css ~> application.scss

	5.4 Insira ao final do arquivo application.scss:

		 @import "bootstrap"; 

	5.5 Adicione para /app/assets/javascripts
		//= require bootstrap

	deverá ficar

		//= require jquery
		//= require bootstrap
		//= require jquery_ujs
		//= require turbolinks
		//= require_tree .

	5.6 Crie um novo arquivo header na pasta app/views/layouts

		_header.html.erb

		neste arquivo insira:

		<nav class="navbar navbar-dark bg-inverse">
			<%= link_to "Blog Cultura Pop", root_path, class: "navbar-brand" %>
			<ul class="nav navbar-nav">

				<li class="nav-item active">
					<%= link_to  "Novo artigo", new_post_path, class: "nav-link" %>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Sobre</a>
				</li>
			</ul>
			<form class="form-inline pull-xs-right">
				<input class="form-control" type="text" placeholder="Search">
				<button class="btn btn-success-outline" type="submit">Buscar</button>
			</form>
		</nav>

	5.7 Em app/views/layouts/ application.html.erb insira na tag header

		<%= render 'layouts/header' %>


* Mais informações sobre como usar o bootstrap
	http://getbootstrap.com/components/

** Drag and drop que gera html com boostrap
	http://www.layoutit.com/build


6 - Configurar o git

	6.1 Instale o git
		sudo apt-get install git

	após instalar verifique a versão
		git version


	6.2 Configure os parametros de autenticação  

		git config -l --global
		
		user.name=Daniel Kehoe
		
		user.email=daniel@danielkehoe.com

	6.3 Inicialize o git para sua aplicação

		git init

		git add .

		git commit -am 'primeiro commit'

	6.4 Vá ao GitHub e crie um novo diretório vazio https://github.com/repositories/new

	adicione um repositório remoto:

		git remote add origin git@github.com:SUA_CONTA_GITHUB/NOME_DO_SEU_PROJETO.git

	envie seu projeto para o GitHub

		git push origin master

* Mais informações como instalar e configurar o git no seu projeto
	https://nandovieira.com.br/configurando-ruby-rails-mysql-postgresql-git-no-ubuntu


7 - Entender mais sobre Models, Views, Controllers e Rotas

http://guias.rubyonrails.com.br.s3-website-us-east-1.amazonaws.com/

http://guias.rubyonrails.com.br.s3-website-us-east-1.amazonaws.com/routing.html

http://guias.rubyonrails.com.br.s3-website-us-east-1.amazonaws.com/action_controller_overview.html





Neste projeto estaremos usando as vesões:

* Ruby 2.3

* Rails 5.0

* sqlite3 (banco de dados)

*Bootstrap 4
