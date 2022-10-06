extends Control

var endDialogue = false
var dialogueStart = false

#Dialogue list for the scene MotherLandBattle
var dialogueMLB_pt = [
	"Criação: Como meu receptáculo, meus poderes passam por suas veias, e com o passar do tempo, mais poderoso será. Agora, irei lhe ensinar como o utilizar.",
	"Criação: Em minha realidade, para cada ação feita, para cada produto concebido, para cada criação criada, precisamos ter uma Visão, um objetivo, um claro entendimento de onde está indo e o motivo de ter escolhido esse caminho",
	"Criação: Simplificando, Visão canaliza o seu poder de criar, canaliza o meu poder em você.",
	"Criação: Agora você precisa saber o que Deployment e User's KPI são. A criação não se materializa do nada, ela passa por um processo rigoroso de entender se o produto é digno de ser criado, se resolve um verdadeiro problema, se será usado por seus usuários",
	"Criação: Você deve usar Deploment KPI's para garantir que meu poder flua em seu corpo da maneira correta. Isso irá garantir uma poderosa conexão entre nós, e talvez, eu venha ao seu auxílio.",
	"Criação: Essa conexão se chama User's KPI, eu serei o usuário da sua relíquia, você a está criando para mim, MANTENHA ISSO EM MENTE",
	"Criação: Como eu disse, cada criação precisa de um propósito, é por isso que se utiliza Dados/Data para criar criações de valor, nunca se esqueça disso, usá-las da maneira correta irá ajudá-lo a ver as coisas como realmente são.",
	"Criação: Quality KPI é usado para identificar problemas em relação às suas criações e os ajustar. Sempre lembre-se que problemas são oportunidades de melhora.",
	"Delliot: E a respeito das minhas habilidades de batalha?",
	"Criação: Esse é o seu 'NEGÓCIO'. Eu sei que você foi treinado pelos melhores para se tornar quem você é, um leal governante. Faça seu trabalho e o próprio trabalho irá mostrar se você está trilhando o caminho certo.",
	"Delliot: Posso chamar isso de Business KPI's?",
	"Criação: Faça como quiser.",
	]
	
var dialogueMLB_en = [
	"Creation: As my vessel, my power flows through your veins, and as the time passes, the stronger you will be. Now let me teach how to use my powers",
	"Creation: In my reality, for each action made, each product conceived, each creation created, we must have a Vision, a goal, a clear understanding of where we’re going and why we chose that path",
	"Creation: Simplifying, Vision canalizes your power to create, it canalizes my power into you",
	"Creation: Now you must know what Deployment and User's KPI are. Creation does not materialize itself, it passes through a rigorous process of understanding if the product is worth creating, if it solves a real problem, if it's going to be used by their users, etc…",
	"Creation: You must use Deployment KPIs to guarantee that my powers are flowing to your body the right way. If you do it right, it will generate a stronger connection between us, and maybe.",
	"Creation: I may come to help you. This connection is called User's KPI, I will be the user of the relique, you are creating it for me, KEEP THAT IN MIND",
	"Creation: As I told you, every creation must have a purpose, that's why we use Data to create valuable things, don’t forget that. Using it the right way may help you see things for what they really are",
	"Creation: Quality KPI is used to identify the root cause of different problems, this way allowing those problems to be adjusted. Always remember that problems open up new opportunities",
	"Delliot: What about my fighting skills?",
	"Creation: That is your business. I know you were trained by the best in order to become the man you are today, a lawful ruler. Do your job, and your job itself will show you if you are going towards the right path.",
	"Delliot: May I call this Business KPIs?",
	"Creation: Do as you wish"
	]

#dialog list for the scene DarkLightForest
var dialogueDLF_pt = [
	"Criação: Toda criação precisa ser meramente calculada, para cada inimigo que você combater, novas estratégias serão criadas, por isso criei o seu Product Backlog, um espaço dimensional onde você conseguirá preparar a canalização do seu poder.",
	"Criação: Lá todas as suas ações estarão listadas para que você as faça quando o tempo chegar",
	"Criação: Seu backlog nada mais é do que uma lista de prioridades a qual a ordem pode mudar de acordo com que novas informações são coletadas",
	"Criação: Agora eu te passo um mapa específico que deveremos seguir desde Homeland à CastleDell. Ele se chama RoadMap e mostra quais passos precisaremos tomar para juntar os fragmentos da minha relíquia",
	"Criação: Agora, vá em direção da Floresta da Clara Escuridão, lá você encontrará seu primeiro inimigo, como também o primeiro fragmento",
	"Delliot: O que é aquilo?",
	"Criação: Cuidado garoto, é um espectro.",
	"Delliot: É um rosto famili... Margareth?",
	"Margareth? A quanto tempo eu não escuto esse nome. MAR - GA - RETH, essa... sou eu, faz tanto tempo que não o escuto que quase me esqueci",
	"Delliot: Eu achei que você havia morrido, o que aconteceu com você?",
	"Margareth: Na queda, meu corpo caiu... mas eu fiquei.",
	"Criação: Margareth,  filha de I-on, criadora maga de CastleDell, ajude a encontrar meus fragmentos. Ajude Delliot a compreender as dimensões do poder da criação, seja sua STAKEHOLDER.",
	"Delliot: Stakeholder?",
	"Criação: Sim, garoto, Stakeholder é caracterizado pelo indivíduo que é impactado pelo resultado da sua criação, se beneficiando com ela. Ele te ajudará sempre que essa satisfação ocorrer, ou seja, sempre o mantenha perto, você sempre irá se beneficiar.",
	"Delliot: Margareth, antes de continuarmos, você sabe quem será meu inimigo nesse lugar?",
	"Margareth: Sprout... Sprout é o ser que domina essa floresta, tome cuidado jovem Delliot. Até onde eu observei durante minha jornada sem sentido, ele possui duas habilidades, ele usa suas raízes para atacar seus inimigos, como também as usa para recuperar sua vida",
	"Delliot: Mais uma pergunta. Em suas palavras, como posso melhorar minha visão?",
	"Margareth: Visão é saber exatamente o que você quer, o que você quer criar, o 'por quê' da criação. Nada mais poderoso do que saber exatamente o que você quer ou onde você está indo. Ao saber isso, você terá a habilidade de dobrar a própria realidade à sua vontadade.",
	"Margareth: Para nunca esquecer, visão é ter uma estrela norte. Qual a sua estrela norte?",
	"Delliot: Ajudar a criação para salvar o meu reino. Obrigado Margareth...",
	"Criação: Garoto, está na hora de ir. Encontre a passagem para enfrentar seu adversário.",
	]
	
var dialogueDLF_en = [
	"Creation: Every creation needs to be precisely calculated. For every enemy you face, new strategies will be created.",
	"Creation: This is why I have created your Product Backlog, a multi-dimensional space where you may prepare to channel your power. There, all of your actions will be listed for you to use when the time is right.",
	"Creation: Your backlog is simply a list of priorities, whose order can change according to new information you find along the way.",
	"Creation: Now I give to you this map, containing the route from Homeland to CastleDell. I call it RoadMap, and it shows the steps we will have to take in order to collect all of the fragments of my relique.",
	"Creation: Now you must go towards the Dark Light Forest. There you will be faced upon your first enemy, as well as the first piece.",
	"Delliot: What is that?",
	"Creation: Careful kid, it’s a spectre",
	"Delliot: What a familiar fa… Margareth?!",
	"Margareth: Margareth? I haven't heard that name in ages. MAR - GA - RETH, thats... thats me. It’s been so long I can barely remember.",
	"Delliot: I thought you died, what happened to you?",
	"Margareth: During the fall, even though my body fell, I stayed",
	"Creation: Margareth, daughter of I-On, wizard creator of CastleDell, help us find my fragments. Help Delliot in understanding the dimensions of the power of creation, be his STAKEHOLDER",
	"Margareth: By my blood, by my lineage, by creation, i promise to teach and guide Delliot in this journey as his Stakeholder",
	"Delliot: Stakeholder?",
	"Creation: Yes, kid, a Stakeholder is characterized by he who benefits from its creation. A Stakeholder will help you everytime this happens, so keep her close to you at all times, and you shall always benefit from this",
	"Delliot: Margareth, before we continue, do you know what enemy I will be facing here?",
	"Margareth: Sprout… Sprout is the being that dominates this forest. Be careful young Delliot. As far as I've observed during my senseless journey, he possesses two abilities. He uses his roots to attack his enemies and heal himself.",
	"Delliot: One more question. In your own words, how can I improve my vision?",
	"Margareth: Vision is knowing exactly what you want, what you want to create, and the reason behind your creation.",
	"Margareth: There is nothing more powerful than knowing exactly what you want and where you’re headed. By knowing this, you’ll have the power of shaping reality itself the way you want it.",
	"Margareth: So you don't forget, Vision is to have a northern star. What is your northern star?",
	"Delliot: Helping creation to save my kingdom",
	"Delliot: Thank you Margareth…",
	"Creation: It's time to go kid, find the passage that will take you to your first battle"
	]

#dialog list for the scene DarkLightBattle
var dialogueDLFB_pt = [
	"Sprout: Quem eu sinto sobre o meu solo? Um humano? ...NÃO!!! Eu conheço essa sensação, Criação? Mas na forma de um humano? Quem é você?",
	"Criação: Pensei que havia te destruído, Sprout",
	"Sprout: Engraçado não é mesmo? O que me criou veio me destruir... de novo. Felizmente é como os humanos falam, o que não te mata te faz mais forte!",
	"Criação: Destrua-o!",
	"Delliot: Pela criação!!",
	]
	
var dialogueDLFB_en = [
	"Sprout: Who is that I feel wandering through my territory? A human perhaps? ...NO!!! I recognize this smell. Creation? In human form? Who are you?",
	"Creation: I thought I had destroyed you, Sprout.",
	"Sprout: Funny, isn't it? My creator has come to destroy me again. You know what they say, what doesn't kill you makes you stronger!",
	"Creation: Enjoy!",
	"Delliot: Its business time!"
	]

#dialog list for the end of the scene DarkLightBattle 
var dialogueDLFBEnd_pt = [
	"Delliot: Ele disse que você o criou... como? Como o Deus da criação criou um Underlord",
	"Criação: Falta de visão garoto. É incrível as coisas que você pode criar quando você não possui uma estrela norte",
	"Criação: Agora não é hora de perguntas, garoto. Vá às catacumbas da aniquilação, lá você encontrará o próximo inimigo, o próximo fragmento",
	]
	
var dialogueDLFBEnd_en = [
	"Delliot: He said you created him… how? How has the god of creation created an Underlord?",
	"Creation: Lack of vision, kid. It's scary what you may create when you dont possess a northern star.",
	"Creation: Enough questions kid. Go to the Catacombs of Annihilation. There you will find your next enemy, the next piece."
	]

#dialogue list for the scene CatacombsOfAnnihilation
var dialogueCAT_pt = [
	"Delliot: Esse lugar é tão claustrofóbico. Tenho certeza que nosso próximo inimigo é forte, mas ao mesmo tempo... pequeno?!",
	"Criação: Essas catacumbas foram criadas há milênios atrás, antes mesmo de eu me tornar um Deus",
	"Delliot: As únicas histórias que ouvi desse lugar são as das pessoas que se aventuram a entrar e nunca mais voltaram",
	"Delliot: Margareth, você sabe quem nós enfrentaremos?",
	"Margareth: Se prepare jovem Delliot, pois eu só havia escutado seu nome nas lendas",
	"Margareth: Gelatto… o destruidor.",
	"Criação: Garoto, garanta que você tenha em suas mãos criações de vida e defesa, você irá precisar. Utilize seu backlog para isso.",
	"Delliot: Farei como sua indicado, criação.",
	"Delliot: Margareth, como a dimensão de Data-driven irá me ajudar com minhas criações?",
	"Margareth: Jovem Delliot, quanto mais dados você tiver sobre seu inimigo e sobre suas próprias criações, mais preparado estará para o momento da batalha. Você estará muito passos à frente do seu inimigo, você terá a oportunidade de mudar as correntes do destino",
	"Criação: Encontre a passagem para chegar ao seu destino, Delliot.",
	]
	
var dialogueCAT_en = [
	"Delliot: This place is so claustrophobic. I am sure our next enemy is strong, but at the same time...  small?",
	"Creation: These catacombs were created millions of years ago, before I even became a god.",
	"Delliot: I’ve heard several stories about this place, about people who come to explor, and are never to be seen again.",
	"Delliot: Margareth, do you know who we’ll be facing?",
	"Margareth: Be ready Delliot, as I’ve only heard his name in the tales",
	"Margareth: Gellato… the destroyer",
	"Creation: Kid, make sure that you have creation of life and defense in hand, you’ll need it. You can use your backlog for this",
	"Delliot: I’ll do as you tell me, Creation",
	"Delliot: Margareth, how can the Data-driven dimension help me with my creations?",
	"Margareth: The more you know about your enemy and your own creations, the more prepared you’ll be for the battle. You’ll be many steps ahead of your enemy, and you’ll have the opportunity of shaping your own destiny",
	"Delliot: Thank you, Margareth",
	"Creation: Now, find the passage to reach your destiny, Delliot."
	]

#dialogue list for the scene CatacombsBattle
var dialogueCATB_pt = [
	"Gelatto: Quem teve a corajosa audácia de atrapalhar o meu sono",
	"Delliot: Ge... ge... ge... llato?",
	"Criação: Não tenha medo garoto pois eu estou com você",
	"Gellatto: Pai… é você? Senti a sua falta!",
	"Gelatto: Espero que dessa vez você consiga, estou cansado da minha inutilidade.",
	"Criação: Acabe com isso garoto.",
	"Delliot: Pela criação!",
	]
var dialogueCATB_en = [
	"Gellato: Who had the outrageous courage to wake me from my slumber?",
	"Delliot: Is that a gi... gi... GIANT????",
	"Creation: Fear not boy,I’m here with you",
	"Gellato: Father, is that you? I missed you!",
	"Gellato: I hope this time you succeed, I am tired of being useless.",
	"Creation: Do it kid",
	"Delliot: It's business time!"
	]

#dialogue list for the end of scene CatacombsBattle
var dialogueCATBEnd_pt = [
	"Delliot: Então... mais um criado por você… como?",
	"Criação: Todos foram criados por mim garoto, e eu me arrependo",
	"Criação: Eu nunca imaginei que iria criar tal calamidade. É isso que acontece quando cria-se algo sem dados, você está sujeito a criar algo que não funcione",
	"Criação: Agora, vá ao cemitério maldito, lá você encontrará seu próximo inimigo, como também o próximo fragmento",
	]
	
var dialogueCATBEnd_en = [
	"Delliot: So... another one created by you... how?",
	"Creation: They were all created by me, however I do regret it",
	"Creation: I never once imagined I would create such a calamity. That's what happens when you don't have data, you create things without purpose.",
	"Creation: Now move to the unholy cemetery, there you will find your next enemy, the next piece."
	]

#dialogue list for the scene Cemetery
var dialogueCEM_pt = [
	"Delliot: O cheiro desse lugar!! Meus olhos estão lacrimejando!", 
	"Delliot: Essa é a hora perfeita para ter uma luta com a morte",
	"Margareth: Quase isso jovem Delliot. Está mais para a luta com um… com um morto",
	"Margareth: Seu nome é Skeleton, o imperfeito.",
	"Criação: Um dos meus primeiros aprendizes, sempre em busca da perfeição até que a imperfeição o corrompeu",
	"Delliot: O que seria a perfeição?",
	"Margareth: Todas as criações possuem defeitos jovem Delliot. Na realidade, nem mesmo a criação é capaz de criar sem defeito, pois sem ela não existe oportunidade de melhora, por isso usamos Quality KPIs",
	"Margareth: Aquele que busca identificar os problemas do produto concebido, arrumá-los e, estar constantemente procurando por novas falhas, estará no caminho do sucesso",
	"Margareth: Aquele que busca criar algo perfeito, está sujeito a imperfeição.",
	"Criação: Ela está certa garoto. Nunca esqueça essas sábias palavras.",
	"Delliot: Então como devo me preparar para essa batalha?",
	"Margareth: Mesmo em sua imperfeição, ele é um criador, lembre-se que seus ossos são mais fortes que escudo e suas garras mais afiadas do que lanças.",
	"Criação: Agora vá Garoto, encontre a passagem para enfrentar seu inimigo.",
	]
var dialogueCEM_en = [
	"Delliot: This place stinks, my eyes are watering!",
	"Delliot: Its the perfect time to fight to the death",
	"Margareth: Almost, you’re actually fighting with someone… dead",
	"Delliot:...",
	"Margareth: He goes by the name Skeleton, the imperfect",
	"Creation: One of my first apprentices, always looking for perfection, until perfection corrupted him",
	"Delliot: What do you mean by perfection?",
	"Margareth: Every creation has its flaws. In reality, not even creation itself is capable of creating perfection, because without it, growth opportunity wouldn’t exist. That’s why we use Quality KPIs",
	"Margareth: Those who are constantly looking for flaws in a conceived product and fix those problems, will be always headed towards success",
	"Margareth: Those who look for perfection, encounter imperfection",
	"Creation: She’s right kid, never forget those wise words",
	"Delliot: Thank you, Margareth!",
	"Delliot: Then how should I prepare for this fight?",
	"Margareth: Even imperfect, he’s still a creator, his bones are stronger than steel, and his claws sharper than a knife.",
	"Delliot: I’ll keep that in mind Margareth.",
	"Creation: Now go find the passage kid"
	]

#dialogue list for the scene CemeteryBattle
var dialogueCEMB_pt = [
	"Skeleton: Cheiro de vida, cheiro de defeitos!!",
	"Skeleton: Você demorou, mestre!",
	"Criação: ...como?",
	"Skeleton: Na morte se encontra a perfeição, porque nada lá pode ser melhorado.",
	"Criação: Vá garoto!",
	"Delliot: Pela criação!"
	]
var dialogueCEMB_en = [
	"Skeleton: I smell life!! I smell flaws!!",
	"Skeleton: You’re too late, Master",
	"Creation: ...How?",
	"Skeleton: In death, you find perfection, since here, there is no room for improvement",
	"Creation: Go kid!",
	"Delliot: For creation!!!!"
	]

#dialogue scene for the end of the scene CemeteryBattle
var dialogueCEMBEnd_pt = [
	"Delliot: Como isso aconteceu com ele?",
	"Criação: Existem milhares de razões para alguém buscar a perfeição.",
	"Criação: Agora garoto, vá à igreja dos condenados, lá você encontrará seu próximo inimigo, como também o próximo fragmento.",
	]
var dialogueCEMBEnd_en = [
	"Delliot: How did that happen to him?",
	"Creation: There are millions of reasons why someone would look for perfection.",
	"Creation: Now, you must go to the Church of the Damned. There you’ll find your next enemy and the next piece."
	]

#dialogue scene for the scene Church
var dialogueCH_pt = [
	"Delliot: Esse lugar costumava ser lindo, todos vinham aqui adorar a criação. Agora sinto apenas cheiro de morte.",
	"Margareth: Delliot, cuidado!!! Seu próximo inimgo se chama Bringer, o ceifador de almas.",
	"Criação: Garoto, não esqueça sobre o user KPI. Ao satisfazer seu cliente com suas criações, um elo forte será criado e eles poderam lhe ajudar.",
	"Criação: No seu caso, eu irei lhe ajudar.",
	"Delliot: Obrigado Criação."
	]
var dialogueCH_en = [
	"Delliot: This place used to be beautiful, people would come here to enjoy creation. Now I only smell death.",
	"Margareth: Delliot, Be careful! Your next enemy is called Bringer, the soul reaper.",
	"Creation: Kid, don't forget about the User KPI. When you satisf your client with your creations, a strong bond will be built between you, and they'll be able to help you.",
	"Creation: In this case, I'll be the one helping you.",
	"Delliot: Thank you Creation."
	]

#dialogue scene for the scene ChurchBattle
var dialogueCHB_pt = [
	"Bringer: Você finalmente chegou, estava lhe esperando.", 
	"Delliot: Cá estou eu.",
	"Bringer: HAHAHAHAHA! Não você verme insignificante.",
	"Criação: Ele está se referindo a mim.",
	"Bringer: Sabe, depois de muito tempo de vida, uma vontade veio em minha cabeça. Como será o gosto da alma do papai?",
	"Hoje irei descobrir! HAHAHAHHAHAHHHA!",
	"Criação: Vá garoto"
	]
var dialogueCHB_en = [
	"Bringer: Finally, you arrived. I've been waiting for you.", 
	"Delliot: Well here I am.",
	"Bringer: HAHAHAHAHA! Not you, you're insignificant.",
	"Creation: He means me",
	"Bringer: You know, after being alive for so long, I couldn't help but wonder, what does daddy's soul taste like?",
	"Bringer: Today is the day I'll find out! HAHAHAHHAHAHHHA!",
	"Creation: Vá garoto"
	]

#dialogue scene for the end of the scene ChurchBattle
var dialogueCHBEnd_pt = [
	"Criação: O criei com o intuito de me ajudar no processo de confecção das criações, ou seja, o seu único objetivo era criar, independente do usuário que o produto estava sendo criado. Seus produtos começaram e se tornar redundantes, então começou a interagir com os usuários.",
	"Criação: Eu o criei apenas para criar e nada mais. A capacidade de se comunicar e criar produtos para os usuários não era inerente a ele, então fugiu... e isso aconteceu.",
	"Criação: Agora garoto, estamos chegando em CastleDell, vá ao forte da ilusão, lá você encontrará seu próximo inimigo, como também a próxima relíquia."
	]
var dialogueCHBEnd_en = [
	"Creation: I created him with the intention of having someone to help me in the creation process, in other words, his only purpose was to create, no matter who the user that’d be using his product was",
	"Creation: His products started to become redundant, so he began interacting with the users",
	"Creation: I created him solely to create, and nothing else, so his capacity of communicating and creating products for users was weak, so he ran away…. and this happened",
	"Creation: Now kid, we’re almost arriving at CastleDell. Go to the Fort of Illusion, there you’ll find your next opponent, and the next piece"
	]

#dialogue list for the scene FortOfIllusion
var dialogueFOI_pt = [
	"Margareth: Vá pelos cantos jovem Delliot, consigo sentir de longe a presença do nosso próximo inimigo.",
	"Delliot: Digo o mesmo, parece que existem olhos sobre mim, sinto que sou a caça na mira de um caçador.",
	"Criação: Cuidado garoto, o arqueiro está aqui. O criei para coletar os recursos para as minhas criações, ele é um perito em dados, como também, em suas palavras, um perito em business.",
	"Delliot: Um arqueiro…", 
	"Margareth: Essa será uma batalha difícil, um especialista em business sempre irá fazer seu máximo para garantir que seu negócio, ou seja, que sua vida continue e seus concorrentes pereçam.",
	"Delliot: Precisarei estar bem armado e equipado para esse confronto.",
	"Criação: Agora vá garoto!",
	]
var dialogueFOI_en = [
	"Margareth: Walk within the edges Delliot, I can feel the presence of our next enemy",
	"Delliot: Me too, I feel like I’m being watched, like I’m the prey in the eyes of a predator",
	"Creation: Careful, the Archer is here. I created her to collect resources for my creations. She’s the master of data, and also, in her own words, a master in business",
	"Delliot: An archer... ",
	"Delliot: This’ll be a tough battle, a business specialist will always do the best they can in order to guarantee that their business, which is their life, will continue, and their opponents perish.",
	"Delliot: I’ll need to be well equipped for this battle",
	"Creation: Now go"
	]

#dialogue list for the scene FortBattle
var dialogueFOIB_pt = [
	"Archer: Olha Delliot, fiquei impressionado com a sua capacidade de ser um alvo.",
	"Delliot: Então porque não me matou?",
	"Archer: Já ouviu falar em honra entre guerreiros?",
	"Delliot: Pronto?",
	"Archer: Sempre estive.",
	]
var dialogueFOIB_en = [
	"Archer: Look, Delliot, I’m impressed with your capability of being a target",
	"Delliot: Then why didn’t you kill me?",
	"Archer: Have you heard about honor between warriors?",
	"Delliot: Are you ready?",
	"Archer: Born ready."
	]

#dialogue list for the end of the scene FortBattle
var dialogueFOIEnd_pt = [
	"Delliot: Uma morte digna de um guerreiro.",
	"Delliot: O que aconteceu, com ele?",
	"Criação: A paixão pelo tal de business o corrompeu, seu objetivo se tornou em ser o melhor.",
	"Delliot: A pena é mais poderosa que a espada.",
	"Criação: Descanse em paz guerreiro."
	]
var dialogueFOIEnd_en = [
	"Delliot: A worthy death for a warrior",
	"Delliot: What happened to her?",
	"Creation: Her passion for business corrupted her. Her goal became to be the best",
	"Delliot: The pen is more powerful than the sword",
	"Delliot: Rest in peace warrior"
	]

#dialogue list for the scene HallsOfStone
var dialogueHOS_pt = [
	"Delliot: Halls of Stone",
	"Delliot: Quantos anos faz que eu não vejo esse lugar. Eu ainda era uma criança... uma criança feliz.",
	"God: Estamos perto garoto, logo todos estarão desfrutando desse lugar.",
	"Margareth: Delliot, num futuro teremos muito tempo para nos lembrar do passado, agora voltando a seus poderes de criação.",
	"Percebi que você pode não estar usando a dimensão de deployment em sua totalidade.",
	"Pense que deployment não existe um custo para você, ou seja, sempre utilize quando possível, sempre o mantendo atualizado, quanto mais rápido usar, melhor, não perca a oportunidade.",
	"Delliot: Obrigado Margareth! Quem nos espera do outro lado desse lugar?",
	"Criação: DukeStone…",
	"Delliot: O que?!",
	"Margareth: Durante a queda, DukeStone vendeu sua vida a Kurgath, jurando servir até o fim dos tempos.",
	"Margareth: Você mesmo sabe que ele é um criador poderoso como também foi um dos nobres mais influentes de CastleDell.",
	"Margareth: Todos sabiam das atrocidades que ele fazia dentro de seu palácio.",
	"Criação: A falta de visão, dados, como também ter seu business comprometido, pode te fazer tomar decisões inconcebíveis.",
	"Delliot: Está na hora do negócio!"
	]
var dialogueHOS_en = [
	"Delliot: Halls of stone.",
	"Delliot: I haven’t been to this place in so long. Last time I visited I was still a child… a happy child",
	"Creation: We’re close kid, soon everyone will be enjoying this place",
	"Margareth: Delliot, in a near future we’ll have a lot of time to remember the past, now, going back to your creation powers",
	"Margareth: I’ve noticed you may not be using the deployment dimension to its full potential.",
	"Margareth: Remember that deployment costs nothing, therefore, use it whenever you can, keeping it always updated. The sooner you use it, the better, don’t lose this opportunity",
	"Delliot: Thank you Margareth!" ,
	"Delliot: Who’s waiting for us in the other side?",
	"Margareth: DukeStone...",
	"Delliot: What?!",
	"Margareth: During the fall, DukeStone sold his life to Kurgath, promising to serve for eternity",
	"Margareth: Even you know that he’s a powerful creator. He was even one of the most influential people of CastleDell.",
	"Margareth: Everyone knew about the atrocities he did inside his palace",
	"Creation: Things like lack of vision and data, and having your business compromised, can all lead you towards making inconceivable choices",
	"Delliot: It’s business time!"
	]

#dialogue list for the scene HallsOfStoneBattle
var dialogueHOSB_pt = [
	"DukeStone: Parece que o pequeno príncipe Delliot virou um homem!",
	"Delliot: O que aconteceu com você? Como você se tornou isso? Um ser de pedras!!!",
	"DukeStone: Depois de jurar lealdade a Kurgath, minha primeira ordem foi eliminar as pessoas que aqui estavam...",
	"DukeStone: Fiz como ordenando, e então Kurgath fez com que as pedras ensanguentadas do Halls of Stone se colassem ao meu corpo.",
	"DukeStone: Podemos dizer que foi uma cerimônia de ‘Bem vindo ao clube’.",
	"Delliot: Ficaria com pena se fosse uma outra situação, mas estou aqui para fazer algo muito pior!",
	"Criação: Elimine-o.",
	"Delliot: Com prazer."
	]
var dialogueHOSB_en = [
	"DukeStone: It seems like little prince Delliot has become a man!",
	"Delliot: What happened to you? Como did you turn into this? A being made of rocks!",
	"DukeStone: After promising eternal loyalty to Kurgath, my first order from him was to kill the people who used to live here…",
	"DukeStone: I did as I was told, and so Kurgath made the bloody walls of Halls of Stone attach to my body",
	"DukeStone: We could say it was like a ‘welcome party’.",
	"Delliot: I’d feel sorrow if we didn’t find ourselfes in this situation, but I’ve come to do something much worse!",
	"Criação: End him",
	"Delliot: With pleasure"
	]

#dialogue list for the end of the scene HallsOfStoneBattle
var dialogueHOSBEnd_pt = [
	"Delliot: Como Kurgath fez isso com ele?",
	"Criação: Kurgath é um perito em todas as dimensões do modelo de produto. Sua capacidade de criar é sem igual.",
	"Delliot: O que isso significa?",
	"Criação: Significa que ele tem a capacidade de criar produtos com uma visão, todas suas decisões são baseadas em dados,",
	"saber o que o cliente precisa, tem um roadmap estruturado como também um backlog claro, sabe da qualidade de seu produto e sempre o mantém atualizado em relação às práticas de Deployment.",
	"Delliot: Wow... porque ele ficou mau?",
	"Criação: Perguntas para outra hora garoto."
	]
var dialogueHOSBEnd_en = [
	"Delliot: How did Kurgath do this to him?",
	"Criação: Kurgath is an expert in all of the dimensions of the product model. His capacity to create is like no other.",
	"Delliot: What does this mean?",
	"Criação: It means that he can create products using vision, that all of his decision are based off of data, that he always knows what his client needs, that he’s got a well structured roadmap and a clear backlog, that he’s aware of his products quality and is able to always maintaining it updated in relation to the Deployment practices.",
	"Delliot: Wow... and why did he become so evil?",
	"Criação: Leave the questions for another time kid."
	]

#dialogue list for the scene HomeLand
var dialogueHL_pt = [
	"Delliot: Estamos quase em CastleDell… essas eram as ruas que eu brincava todos os dias, Homeland.",
	"Delliot: O fragmento da criação está quase pronto, faltam mais duas partes.",
	"Criação: Estamos quase no final de nossa jornada garoto... você está indo bem.",
	"Margareth: Delliot!!!",
	"Margareth: Seu pró... próxi... próximo inimigo será o Balrog!!!",
	"Delliot: Balrog?",
	"Criação: A mão direita de Kurgath, o que o auxilia em todos os processos de criação, seu StakeHolder.",
	"Margareth: Até onde eu sei, Balrog foi criado pelo próprio Kurgath, se tornando um StakeHolder que se beneficia com produtos que não o beneficiam.",
	"Margareth: Ou seja, Balrog se torna mais forte com as criações que não agregam.",
	"Delliot: Diante de tantas atrocidades, ele com toda certeza deve ser forte.",
	"Criação: Vá delliot."
	]
var dialogueHL_en = [
	"Delliot: We’re almost in CastleDell",
	"Delliot: These were the streets I used to play at everyday",
	"Delliot: The relique is almost ready, we only need to collect two more pieces.",
	"Creation: You’re doing very well, we’re almost done.",
	"Margareth: Delliot!!!",
	"Margareth: Seu próximo inimigo será o… B… B… Balrog!!!",
	"Delliot: Balrog?",
	"Creation: Kurgaths right hand, who helps him in every process of creation, his StakeHolder.",
	"Margareth: As far as I know, Balrog was created by Kurgath himself, becoming a StakeHolder that benefits from products that don’t benefit him.",
	"Margareth: Meaning Balrog gains strength from creations that he shouldn’t gain from.",
	"Delliot: Wow... I’m sure he’s very strong.",
	"Creation: Go Delliot"
	]

#dialogue list for the scene HomeLandBattle
var dialogueHLB_pt = [
	"Balrog: VOCÊ NÃO IRÁ PASSAR!!!!",
	"Delliot: Está na hora do negócio!"
	]
var dialogueHLB_en = [
	"Balrog: YOU WILL NOT PASS!!!",
	"Delliot: It’s business time!"
	]

#dialogue list for the scene Final
var dialogueFinal_pt = [
	"Delliot: Finalmente… CastleDell… Casa…",
	"God: Não abaixe a guarda garoto.",
	"Alguém: Ele está certo, não abaixe a guarda garoto.",
	"Delliot: Kurgath!",
	"Kurgath: Estava te esperando pequeno príncipe.",
	"Delliot: Você tirou tudo de mim!",
	"Kurgath: Eu tirei tudo de você? HAHAHAHAHAHAHAHAHA!",
	"Kurgath: Essa é a melhor piada que escuto em anos!",
	"Kurgath: Como se eu tivesse algo a ver com isso. Quem tirou tudo de você está logo em cima de você, não é mesmo, irmão?",
	"Delliot: Como?",
	"Criação: Delliot, há muito tempo, para toda criação criada, havia a destruição, sendo esse meu irmão.",
	"Criação: Eu não conseguia dar continuidade aos meus projetos, então o aprisionei em minha relíquia, a criação mais poderosa já criada.",
	"Criação: Ao aprisioná-lo, pude criar, imaginar, fazer com que minhas ideias durassem, mas logo me vi em um impasse. O mundo estava fora de ordem.",
	"Criação: Assim como o ying yang, a criação está para a destruição.",
	"Criação: Precisei me tornar, também, o deus da destruição. Foi a tarefa mais difícil que já tive.",
	"Criação: Durante éons mantive esse papel, até não aguentar mais.",
	"Criação: Então liberei meu irmão de minha relíquia, imaginei que poderíamos conver...",
	"Kurgath: CONVERSAR?! COMO OUSA?! Eu estou aqui para acabar com tudo que foi criado, até mesmo você."
	]
var dialogueFinal_en = [
	"Delliot: Finally… CastleDell… Home…",
	"God: Don’t let your guard down",
	"Someone: He’s right, don’t let your guard down.",
	"Delliot: Kurgath!",
	"Kurgath: I’ve been waiting for you little prince",
	"Delliot: You took everything from me!",
	"Kurgath: I took everything from you?! HAHAHAHAHAHAHAHAHA!",
	"Kurgath: That’s the best joke I’ve heard in ages!",
	"Kurgath: As if I had anything to do with this. The man who took everything from you is right above you, isn’t that right, brother?",
	"Delliot: Wait… How?",
	"Creation: Delliot, a very long time ago, destruction was present in the creation of everything created. That's how Kurgath, my brother, came to life",
	"Creation: I wasn’t able to give continuity to my projects, so I imprisoned him inside my relique, the most powerful creation ever created.",
	"Creation: When I imprisoned him, I was able to create, imagine and make my ideas last, but I soon found myself in trouble. The world was out of order.",
	"Creation: Just like the ying-yang, creation is there for destruction.",
	"Creation: During that time, I was forced to become the god of destruction. It was the toughest task I’ve ever had.",
	"Creation: For ages I had to keep this role, until I couldn’t take it anymore.",
	"Creation: So I had to free my brother from the relique. I thought we’d be able to ta…",
	"Kurgath: CONVERSAR?! COMO OUSA?! Eu estou aqui para acabar com tudo que foi criado, até mesmo você.",
	"Kurgath: TALK?! HOW DARE YOU?! I’m here to destroy all that was created, including you!"
	]

#dialogue list for the scene FinalBattle
var dialogueFinalB_pt = [
	"Kurgath: Deixe-me entrar em minha forma física.",
	"Delliot: Está na hora do negócio."
	]
var dialogueFinalB_en = [
	"Kurgath: Let me transform into my physical form.",
	"Delliot: It’s business time!"
	]

#dialogue list for the end of the scene FinalBattle
var dialogueFinalBEnd_pt = [
	"Kurgath: Como? Como você conseguiu me..."
	]
var dialogueFinalBEnd_en = [
	"Kurgath: How? How were you able to... "
	]
