extends Node2D
var sceneToGo = "res://scenes/MotherLand.tscn"

func _ready():
	Global.language = 0

func _on_BR_button_pressed():
	$ButtonSound.play()
	Global.language = 1
	TranslationServer.set_locale("pt_BR")
	print ("portuguese now")
	GlobalDeckBuilder.ownedCards = [
		#deployment
		{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
		#data
		{"type":"data", "cost":9, "name":"Sight", "description":"Pelo resto do jogo, sempre saiba o próximo +1 ataque do inimigo", "dataCards":0, "dataEnemy":1},
		{"type":"data", "cost":1, "name":"Foreshadowing", "description":"Durante esse round, veja o próximo ataque do oponente", "dataCards":0, "dataEnemy":1},
		{"type":"data", "cost":5, "name":"Revelations", "description":"Veja os próximos 5 ataques do oponente", "dataCards":0, "dataEnemy":5},
		{"type":"data", "cost":3, "name":"The Library", "description":"Veja as próximas 5 cartas do Deck", "dataCards":5, "dataEnemy":0},
		{"type":"data", "cost":9, "name":"Pseudo-omniscience", "description":"Pelo resto do jogo, sempre saiba sua próxima +1 carta", "dataCards":1, "dataEnemy":0},
		#business
		{"type":"business", "cost":1, "name":"Dueling", "description":"Cause 5 de dano", "damage":5, "shield":0},
		{"type":"business", "cost":3, "name":"Great Weapons Fighting", "description":"Dano com armas pesadas, 16 de dano", "damage":16, "shield":0},
		{"type":"business", "cost":7, "name":"Raw Damage", "description":"Pura força bruta, cause 38 de dano", "damage":38, "shield":0},
		{"type":"business", "cost":2, "name":"Defense", "description":"Use seu escudo e ganhe +15 de defesa", "damage":0, "shield":15},
		{"type":"business", "cost":5, "name":"Warriors Armor", "description":"Use sua armadura e ganhe +6 de defesa", "damage":0, "shield":6},
		{"type":"business", "cost":10, "name":"Shield Wall", "description":"Invoque uma parede de escudos e ganhe +60 de defesa", "damage":0, "shield":60},
		#vision:
		{"type":"vision", "cost":2, "name":"Lay on hands", "description":"Cure 12 de vida", "heal":12, "plus":0},
		{"type":"vision", "cost":15, "name":"Divine Smite", "description":"Seu deus te da forças para o proximo ataque, some mais 50 ao seu próximo ataque", "heal":0, "plus":50},
		{"type":"vision", "cost":16, "name":"Divine health", "description":"Seu deus te da forças para recuperar toda a sua vida", "heal":100, "plus":0},
		{"type":"vision", "cost":1, "name":"Minor Healing", "description":"Cure 2 de vida", "heal":2, "plus":0},
		#quality
		{"type":"quality", "cost":8, "name":"Double Effect", "description":"Dobre o valor da sua proxima carta", "multiply":2, "plus":0}
		]
	GlobalDeckBuilder.deckDictionary = [
		#deployment
		{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
		#data
		{"type":"data", "cost":1, "name":"Foreshadowing", "description":"Durante esse round, veja o próximo ataque do oponente", "dataCards":0, "dataEnemy":1},
		{"type":"data", "cost":3, "name":"The Library", "description":"Veja as próximas 5 cartas do Deck", "dataCards":5, "dataEnemy":0},
		#business
		{"type":"business", "cost":1, "name":"Dueling", "description":"Cause 5 de dano", "damage":5, "shield":0},
		{"type":"business", "cost":2, "name":"Defense", "description":"Use seu escudo e ganhe +3 de defesa", "damage":0, "shield":3},
		#vision:
		{"type":"vision", "cost":1, "name":"Minor Healing", "description":"Cure 2 de vida", "heal":2, "plus":0},
		#quality
		{"type":"quality", "cost":8, "name":"Enhance", "description":"Some 5 a susa próxima ação", "multiply":0, "plus":5},
		{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
		{"type":"deployment", "cost":0, "name":"Deployment", "description":"O processo de criação"},
		{"type":"business", "cost":1, "name":"Dueling", "description":"Cause 5 de dano", "damage":20, "shield":0},
		{"type":"business", "cost":2, "name":"Defense", "description":"Use seu escudo e ganhe +3 de defesa", "damage":0, "shield":3},
		]
	GlobalDeckBuilder.dimensionTexts = {
		"Vision":"O(A) jogador(a) deve manter seus objetivos em mente. As cartas de visão o(a) permite se curar e sempre lembrar dos seus objetivos, dando-lhe a força necessária para continuar lutando. No Modelo de Produto do mundo real, a Visão é uma declaração de intenção indicando o que uma empresa, unidade de negócios ou equipe quer se tornar e orientando iniciativas de transformação, definindo uma direção definida para o crescimento futuro.\n\nComo parte da jornada de transformação o Modelo de Produto é dividido em quatro níveis cada vez mais maduros:\n\nA equipe está no nível 1 quando não tem conhecimento ou não possui uma visão de produto;\nSe encontra no nível 2 quando está ciente de sua visão de produto e acredita que ela reflete o objetivo de seu trabalho;\n\nAEstá no nível 3 quando usa a visão do produto para moldar as decisões do produto;\n\nAAtinge o nível 4 quando a equipe está apoiada por um Conselho de Crescimento, ou seja, alavanca continuamente a linha de produtos, compartilha oportunidades ou resultados de experimentos e continua a aproveitar os dados para demonstrar e gerar valor.",
		"Data Driven":"O(A) jogador(a) deve levar em consideração as informações disponíveis, isso significa ser orientado(a) por dados. Por isso, cartões de orientação de dados fornecem dados sobre a batalha. Seja em relação às próximas cartas do deck ou aos seguintes ataques inimigos. No Modelo de Produto do mundo real, a Orientação de Dados é pelo progresso atual e futuro do estado do produto com base em dados convincentes, e não por intuição ou experiência pessoal.\n\nComo parte da jornada de transformação o Modelo de Produto é dividido em quatro níveis cada vez mais maduros:\n\nA equipe está no nível 1 quando não acompanha os KPIs em mudança;\n\nSe encontra no nível 2 quando acompanha as métricas de sucesso do usuário e do negócio ao longo do tempo e os valores dessas métricas são atualizados pelo menos uma vez por trimestre;\n\nEstá no nível 3 quando acompanha as métricas de sucesso do usuário e do negócio ao longo do tempo e os valores dessas métricas são atualizados pelo menos uma vez por ciclo de negócios (a meta é entre 1 semana e 1 mês);\n\nAtinge o nível 4 quando a equipe acompanha o sucesso de métricas do usuário e do negócio. Faz alterações no backlog, visão, roteiro e decisões das partes interessadas do negócio.",
		"Deployment KPIs":"O(A) jogador(a) deve garantir que as implementações sejam feitas continuamente. As cartas de Implementação lhe dão o recurso de implementar outras cartas. No Modelo de Produto do mundo real, os KPIs de Implementação garantem que todos tenham acesso ao estágio atual do produto.\n\nComo parte da jornada de transformação o Modelo de Produto é dividido em quatro níveis cada vez mais maduros:\n\nA equipe está no nível 1 quando o código-fonte do produto não está localizado no GitLab;\n\nSe encontra no nível 2 quando o código-fonte do produto está localizado no GitLab e a pontuação do Release Automation conforme DevOps Assessment Dashboard é < 100%. O produto está de acordo com o Painel de Avaliação DevOps. E a média de Implementação/Mês que os usuários recebem > 0;\n\nEstá no nível 3 quando o código-fonte do produto está localizado no Gitlab e a pontuação do Release Automation conforme DevOps Assessment Dashboard é 100%. O produto está de acordo com o Painel de Avaliação Devops. E a média de Implantação/Semana que os usuários recebem > 0;\n\nAtinge o nível 4 quando o código-fonte do produto está localizado no GitLab e a pontuação do Release Automation conforme DevOps Assessment Dashboard é 100%. Além disso, o produto foi aprovado para uma mudança padrão no ServiceNow. O produto está de acordo com o Painel de Avaliação Devops. E a média de Implementação/Dia que os usuários recebem > 0.",
		"Quality KPIs":"O(A) jogador(a) deve garantir a redução de erros e aumentar a qualidade do produto. As cartas de Qualidade evoluem outras cartas. No Modelo de Produto do mundo real, os KPIs de Qualidade são indicadores-chaves de desempenho, focados no rastreamento de bugs de produção e reduzir acontecimentos inesperados com priorização apropriada ao longo do trabalho.\n\nComo parte da jornada de transformação o Modelo de Produto é dividido em quatro níveis cada vez mais maduros:\n\nA equipe está no nível 1 quando não há rastreamento de defeitos de produção;\n\nSe encontra no nível 2 quando a equipe rastreia os defeitos como itens de trabalho;\n\nEstá no nível 3 quando a equipe prioriza os defeitos em relação aos novos recursos com total autonomia;\n\nAtinge o nível 4 quando a equipe usa defeitos de produção para impulsionar na adoção de práticas que melhorem a qualidade de todos os estágios de desenvolvimento, por exemplo, Test Driven, Desenvolvimento, Descoberta e Enquadramento.",
		"Business KPIs":"O(A) jogador(a) deve medir quão bem seu projeto está indo em relação aos negócios. Portanto em Castledell eles representam Escudo e Danos, que afetam diretamente o resultado da batalha. No Modelo de Produto do mundo real, os KPIs de Negócio são a métrica de desempenho chave orientada para alcançar resultados por sucesso comercial claramente articulado de forma mensurável. Eles devem mudar regularmente ao longo do tempo com base no aprendizado validado por meio de iterações de produtos e comunicações contínuas com as partes interessadas.\n\nComo parte da jornada de transformação o Modelo de Produto é dividido em quatro níveis cada vez mais maduros.\n\nA equipe está no nível 1 quando não acompanha as métricas de sucesso de négocios;\n\nSe encontra no nível 2 quando as métricas de sucesso de negócios estão definidas e os atuais KPIs estão definidos;\n\nEstá no nível 3 quando a Métrica de Sucesso de Negócios foi rastreada por meio de vários ciclos de usuário de construção-medição-aprendizagem;\n\nAtinge o nível 4 por meio do acompanhamento da Métrica de Sucesso do Negócio, a equipe pode demonstrar seu valor contribuído para o Negócio ao longo do tempo.",
		"Roadmap":"No Modelo de Produto do mundo real, é necessário um Roteiro baseado em resultados para alinhar os objetivos do produto com recursos e lançamentos a longo prazo para orientar as discussões sobre prioridades e desviar as objeções.\n\nComo parte da jornada de transformação o Modelo de Produto é dividido em quatro níveis cada vez mais maduros:\n\nA equipe está no nível 1 quando não possui um roteiro de produto;\n\nSe encontra no nível 2 quando a equipe desenvolveu um roteiro de produto testável e baseado em resultados por meio de interações de usuários e partes interessadas;\n\nEstá no nível 3 quando a equipe pode ajustar o roteiro do produto com base nas necessidades do usuário;\n\nAtinge o nível 4 quando a equipe considera as necessidades do usuário para orientar proativamente as decisões do roteiro do produto.",
		"User KPIs":"No Modelo de Produto do mundo real, os KPIs de Usuário são uma métrica de desempenho chave focada em alcançar resultados por sucesso do usuário claramente articulado de forma mensurável. Os KPIs do usuário devem ser atualizados regularmente para refletir o aprendizado validado por meio de iterações de produtos e comunicações contínuas com as partes interessadas. CSAT é um exemplo de KPI do usuário para rastrear.\n\nComo parte da jornada de transformação o Modelo de Produto é dividido em quatro níveis cada vez mais maduros:\n\nA equipe está no nível 1 quando não acompanha as métricas de sucesso do usuário;\n\nSe encontra no nível 2 quando as métricas de sucesso do usuário são definidas e os KPIs atuais do produto são conhecidos;\n\nEstá no nível 3 quando as métricas de sucesso do usuário foram rastreadas por meio de vários ciclos de usuário de construção-medição-aprendizagem;\n\nAtinge o nível 4 quando a equipe empatiza com o usuário e reflete sobre as métricas de sucesso do usuário.",
		"Stakeholders":"No Modelo de Produto do mundo real, os Stakedolders são um grupo, organização ou individuo que é impactado pelo resultado de um projeto. Eles têm interesse no sucesso de um determinado produto e podem estar dentro ou fora da organização patrocinadora. Esta métrica destina-se a medir a comunicação e o engajamento em direção ao alinhamento e parceria compartilhados.\n\nComo parte da jornada de transformação o Modelo de Produto é dividido em quatro níveis cada vez mais maduros:\n\nA equipe está no nível 1 quando não possui reuniões com as partes interessadas do negócio e não recebem informações que influenciem as iterações;\n\nSe encontra no nível 2 quando a equipe possui reuniões frequentes com os stakeholders e recebem informações que influenciam as iterações;\n\nEstá no nível 3 quando a equipe de produto mudou o plano de negócios com base no que aprendeu;\n\nAtinge o nível 4 quando a parte interessada de negócios experimentou um aprendizado validado por meio de iterações do loop Build Measure Learn que lhes deu valor/insight de negócios.",
		"Backlog":"No Modelo de Produto do mundo real, o Backlog é uma lista de histórias priorizadas que compõem o trabalho planejado para a iteração atual. As histórias podem ser adicionadas e removidas do backlog e são continuamente redefinidas durante uma iteração à medida que a equipe aprende novas informações.\n\nComo parte da jornada de transformação o Modelo de Produto é dividido em quatro níveis cada vez mais maduros.\n\nA equipe está no nível 1 quando não rastreia volume, backlog, trabalho em andamento, histórias finalizadas, velocidade e volatilidade de histórias de usuários ou estabelecer uma linha de base para cada uma;\n\nSe encontra no nível 2 quando a equipe está rastreando o volume e a volatilidade das histórias de usuários e estabeleceu uma linha de base para cada;\n\nEstá no nível 3 quando a volatilidade < 50% e velocidade > tamanho médio da história;\n\nAtinge o nível 4 quando a equipe está aproveitando as métricas de backlog para impulsionar as expectativas de pontualidade do produto."
		}

func _on_EN_button_pressed():
	$ButtonSound.play()
	Global.language = 0
	TranslationServer.set_locale("en")
	print ("english now")
	GlobalDeckBuilder.ownedCards = [
		#deployment
		{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
		#data
		{"type":"data", "cost":9, "name":"Sight", "description":"Know your opponents next +1 attack for the entire match", "dataCards":0, "dataEnemy":1},
		{"type":"data", "cost":1, "name":"Foreshadowing", "description":"View your opponents next attack during this round", "dataCards":0, "dataEnemy":1},
		{"type":"data", "cost":5, "name":"Revelations", "description":"View the 5 next attacks of your opponent", "dataCards":0, "dataEnemy":5},
		{"type":"data", "cost":3, "name":"The Library", "description":"View the 5 next cards on the deck", "dataCards":5, "dataEnemy":0},
		{"type":"data", "cost":9, "name":"Pseudo-omniscience", "description":"Know your own next +1 attack for the entire match", "dataCards":1, "dataEnemy":0},
		#business
		{"type":"business", "cost":1, "name":"Dueling", "description":"Deal 5 damage", "damage":5, "shield":0},
		{"type":"business", "cost":3, "name":"Great Weapons Fighting", "description":"Heavy weapons, deal 16 damage", "damage":16, "shield":0},
		{"type":"business", "cost":7, "name":"Raw Damage", "description":"Pure brute force, deal 38 damage", "damage":38, "shield":0},
		{"type":"business", "cost":2, "name":"Defense", "description":"Use shield and gain +15 defense", "damage":0, "shield":15},
		{"type":"business", "cost":5, "name":"Warriors Armor", "description":"Use shield and gain +6 defense", "damage":0, "shield":6},
		{"type":"business", "cost":10, "name":"Shield Wall", "description":"Invoque a wall of shields and gain +60 defense", "damage":0, "shield":60},
		#vision:
		{"type":"vision", "cost":2, "name":"Lay on hands", "description":"Heal 12 health", "heal":12, "plus":0},
		{"type":"vision", "cost":15, "name":"Divine Smite", "description":"Your god gives you strength for your next move, add +50 to your next attack", "heal":0, "plus":50},
		{"type":"vision", "cost":16, "name":"Divine health", "description":"Your god gives you strength to recover all your health", "heal":100, "plus":0},
		{"type":"vision", "cost":1, "name":"Minor Healing", "description":"Heal 2 health", "heal":2, "plus":0},
		#quality
		{"type":"quality", "cost":8, "name":"Double Effect", "description":"Double the effect of your next card", "multiply":2, "plus":0}
		]
	GlobalDeckBuilder.deckDictionary = [
		#deployment
		{"type":"deployment", "cost":0, "name":"Deployment", "description":"The creation process"},
		#data
		{"type":"data", "cost":1, "name":"Foreshadowing", "description":"View your opponents next attack during this round", "dataCards":0, "dataEnemy":1},
		{"type":"data", "cost":3, "name":"The Library", "description":"View the 5 next cards on the deck", "dataCards":5, "dataEnemy":0},
		#business
		{"type":"business", "cost":1, "name":"Dueling", "description":"Deal 5 damage", "damage":5, "shield":0},
		{"type":"business", "cost":2, "name":"Defense", "description":"Use shield and gain +15 defense", "damage":0, "shield":15},
		#vision:
		{"type":"vision", "cost":1, "name":"Minor Healing", "description":"Heal 2 health", "heal":2, "plus":0},
		#quality
		{"type":"quality", "cost":8, "name":"Enhance", "description":"Add 5 to your next action", "multiply":0, "plus":5},
		{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of creation"},
		{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of creation"},
		{"type":"business", "cost":1, "name":"Dueling", "description":"Deal 5 damage", "damage":5, "shield":0},
		{"type":"business", "cost":2, "name":"Defense", "description":"Use shield and gain +3 defense", "damage":0, "shield":3},
		]
	GlobalDeckBuilder.dimensionTexts = {
		"Vision":"The player should keep their goals in mind. Vision cards allow the player to heal and always remember his goals, giving him the strength necessary to keep fighting. In the real world product model, vision is a declaration of intention indicating what a company, business unit or team wants to become and guiding initiatives of transformation, defining a direction defined for the growth in the future. \n\nAs part of the transformation journey, the product model is divided into 4 levels, each defined by maturity levels:\n\nThe team finds itself at level 1 when it doesn't possess knowledge or a product vision;\nIt's in level 2 when it's aware of its product vision and believes that it reflects the goal of its work;\n\nIt's in level 3 when it uses product vision to mold the decisions of the product;\n\nIt reaches level 4 when the team is supported by a gowth counsil, therefore it continuously leverages the products line, shares opportunities or results of experiments and continues to enjoy data to demonstrate and generate value.",
		"Data Driven":"The player must take into account the information available, this means being data driven. Therefore, data guidance cards provide data about the battle. Whether in relation to the next cards in the deck or the following enemy attacks. In the real world Product Model, the Data Orientation is for current and future progress of the product state based on compelling data, not intuition or personal experience.\n\nAs part of the transformation journey the Product Model is divided into four increasingly mature levels:\n\nThe team is at level 1 when it does not keep up with changing KPIs;\n\nIt is at level 2 when it tracks user and business success metrics over time, and the values ​​of these metrics are updated at least once a quarter;\n\nIt is at level 3 when it tracks user and business success metrics over time and the values ​​of these metrics are updated at least once per business cycle (target is between 1 week and 1 month);\n\nReaches level 4 when the team tracks the success of user and business metrics. Makes changes to the backlog, vision, roadmap and business stakeholder decisions.",
		"Deployment KPIs":"The player must ensure that implementations are made on an ongoing basis. Implementation cards give you the ability to implement other cards. In the real-world Product Model, Implementation KPIs ensure that everyone has access to the current stage of the product.\n\nAs part of the transformation journey the Product Model is divided into four increasingly mature levels:\n\nA team is at level 1 when the product source code is not located in GitLab;\n\nIt is at level 2 when the product source code is located in GitLab and the Release Automation score as per DevOps Assessment Dashboard is < 100 %. The product complies with the DevOps Scoreboard. And the average Implementation/Month that users get > 0;\n\nIt is at level 3 when the product source code is located in Gitlab and the Release Automation score as per DevOps Assessment Dashboard is 100%. The product complies with the Devops Scoreboard. And the average Deployment/Week users receive > 0;\n\nReaches level 4 when product source code is located on GitLab and Release Automation score as per DevOps Assessment Dashboard is 100%. In addition, the product has been approved for a default change in ServiceNow. The product complies with the Devops Scoreboard. And the average Deployment/Day that users get > 0.",
		"Quality KPIs":"The player must ensure the reduction of errors and increase the quality of the product. Quality cards evolve other cards. In the real-world Product Model, Quality KPIs are key performance indicators, focused on tracking production bugs and reducing unexpected events with proper prioritization throughout the work.\n\nAs part of the transformation journey the Product Model Product is divided into four increasingly mature levels:\n\nThe team is at level 1 when there is no tracking of production defects;\n\nIt is at level 2 when the team tracks defects as work items;\n \nIt is at level 3 when the team prioritizes defects over new features with full autonomy;\n\nIt reaches level 4 when the team uses production defects to drive the adoption of practices that improve the quality of all stages of development , for example, Test Driven, Development, Discovery, and Framing.",
		"Business KPIs":"The player must measure how well their project is doing relative to the business. So in Castledell they represent Shield and Damage, which directly affect the outcome of battle. In the real-world Product Model, Business KPIs are the key performance metric driven to achieve results by clearly articulated business success in a measurable way. They must change regularly over time based on learning validated through product iterations and ongoing communications with stakeholders.\n\nAs part of the transformation journey the Product Model is broken down into four increasingly mature levels. \n\nThe team is at level 1 when it does not track business success metrics;\n\nIt is at level 2 when business success metrics are defined and current KPIs are defined;\n\nIt is at level 3 when the Business Success Metric has been tracked through multiple build-measure-learn user cycles;\n\nReaches level 4 by tracking the Business Success Metric, the team can demonstrate its contributed value to the Business over time.",
		"Roadmap":"In the real-world Product Model, a results-based Roadmap is needed to align product goals with features and long-term releases to guide discussions on priorities and deflect objections.\n\nAs part of the transformation journey the Model is divided into four increasingly mature levels:\n\nThe team is at level 1 when it does not have a product roadmap;\n\nIt is at level 2 when the team has developed a testable, results-based product roadmap through user and stakeholder interactions;\n\nIt is at level 3 when the team can adjust the product roadmap based on the user's needs;\n\nIt reaches level 4 when the team considers the user's needs to guide proactively make product roadmap decisions.",
		"User KPIs":"In the real-world Product Model, User KPIs are a key performance metric focused on achieving clearly articulated user success results in a measurable way. User KPIs should be updated regularly to reflect learning validated through product iterations and ongoing stakeholder communications. CSAT is an example user KPI to track.\n\nAs part of the transformation journey the Product Model is broken down into four increasingly mature levels:\n\nThe team is at level 1 when it doesn't track success metrics of user;\n\nIs at level 2 when user success metrics are defined and current product KPIs are known;\n\nIs at level 3 when user success metrics have been tracked through multiple cycles build-measure-learn user process;\n\nReaches level 4 when the team empathizes with the user and reflects on user success metrics.",
		"Stakeholders":"In the real-world Product Model, Stakedolders are a group, organization, or individual that is impacted by the outcome of a project. They have an interest in the success of a particular product and may be inside or outside the sponsoring organization. This metric is intended to measure communication and engagement towards shared alignment and partnership.\n\nAs part of the transformation journey the Product Model is divided into four increasingly mature levels:\n\nThe team is at the level 1 when it does not have meetings with business stakeholders and does not receive information that influences iterations;\n\nIt is found at level 2 when the team has frequent meetings with stakeholders and receives information that influences iterations;\n\nIt is at level 3 when the product team changed the business plan based on what they learned;\n\nReaches at level 4 when the business stakeholder experienced learning validated through iterations of the Build Measure Learn loop that gave them value/ business insight.",
		"Backlog":"In the real-world Product Model, the Backlog is a list of prioritized stories that make up the planned work for the current iteration. Stories can be added to and removed from the backlog and are continually redefined during an iteration as the team learns new information.\n\nAs part of the transformation journey the Product Model is divided into four increasingly mature levels.\n \nThe team is at level 1 when it does not track volume, backlog, work in progress, finished stories, velocity and volatility of user stories or establish a baseline for each;\n\nIt is at level 2 when the team is tracking the volume and volatility of user stories and established a baseline for each;\n\nIt is at level 3 when volatility < 50% and velocity > average story size;\n\nIt reaches level 4 when the team is leveraging backlog metrics to drive product timeliness expectations.",
		}

func _on_play_button_pressed(): #this fuction is to start the game
	$ButtonSound.play()
	TransitionScreen.FadeInto(sceneToGo)

func _on_level_select_pressed():
	$ButtonSound.play()
	TransitionScreen.FadeInto("res://scenes/LevelSelect.tscn")
	
func _on_config_button_pressed():#leva para o menu do jogo, onde é possível fazer ajustes
	$ButtonSound.play()
	yield(get_tree().create_timer(0.1), "timeout")
	$PauseMenu.show_on_top
	$PauseMenu.open()

func _on_quit_button_pressed():#essa função fecha o jogo
	$ButtonSound.play()
	yield(get_tree().create_timer(0.24), "timeout")
	get_tree().quit()
