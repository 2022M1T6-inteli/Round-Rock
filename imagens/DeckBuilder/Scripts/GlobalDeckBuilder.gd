extends Node

#Used to define which dimensions buton has been clicked
var dimension = ""

var oneCardOnly = false
# Your cuurrent deck, with the cards in the form of objects
var deck = []
# A list of the cards you own. Each in the format of a dictionary
var ownedCards = [
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

# Your deck, but the cards are in dictionary format. Useful for exchanging between the deck selection screen model of card and the battle model of card
var deckDictionary = [
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The creation process"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The creation process"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The creation process"},
	{"type":"data", "cost":1, "name":"Foreshadowing", "description":"View your opponents next attack during this round", "dataCards":0, "dataEnemy":1},
	{"type":"business", "cost":1, "name":"Dueling", "description":"Deal 5 damage", "damage":5, "shield":0},
	{"type":"business", "cost":2, "name":"Defense", "description":"Use shield and gain +15 defense", "damage":0, "shield":15},
	{"type":"vision", "cost":1, "name":"Minor Healing", "description":"Heal 2 health", "heal":2, "plus":0},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"business", "cost":1, "name":"Dueling", "description":"Deal 5 damage", "damage":5, "shield":0},
	{"type":"business", "cost":3, "name":"Great Weapons Fighting", "description":"Heavy weapons, deal 16 damage", "damage":16, "shield":0},
	{"type":"business", "cost":7, "name":"Raw Damage", "description":"Pure brute force, deal 38 damage", "damage":38, "shield":0},
	{"type":"business", "cost":1, "name":"Dueling", "description":"Deal 5 damage", "damage":5, "shield":0},
	{"type":"vision", "cost":2, "name":"Lay on hands", "description":"Heal 12 health", "heal":12, "plus":0},
	{"type":"vision", "cost":15, "name":"Divine Smite", "description":"Your god gives you strength for your next move, add +50 to your next attack", "heal":0, "plus":50},
	{"type":"vision", "cost":16, "name":"Divine health", "description":"Your god gives you strength to recover all your health", "heal":100, "plus":0},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"data", "cost":9, "name":"Sight", "description":"Know your opponents next +1 attack for the entire match", "dataCards":0, "dataEnemy":1},
	{"type":"data", "cost":1, "name":"Foreshadowing", "description":"View your opponents next attack during this round", "dataCards":0, "dataEnemy":1},
	{"type":"data", "cost":5, "name":"Revelations", "description":"View the 5 next attacks of your opponent", "dataCards":0, "dataEnemy":5},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"business", "cost":1, "name":"Dueling", "description":"Deal 5 damage", "damage":5, "shield":0},
	{"type":"business", "cost":3, "name":"Great Weapons Fighting", "description":"Heavy weapons, deal 16 damage", "damage":16, "shield":0},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"business", "cost":1, "name":"Dueling", "description":"Deal 5 damage", "damage":5, "shield":0},
	{"type":"business", "cost":3, "name":"Great Weapons Fighting", "description":"Heavy weapons, deal 16 damage", "damage":16, "shield":0},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"quality", "cost":8, "name":"Double Effect", "description":"Double the effect of your next card", "multiply":2, "plus":0},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"business", "cost":1, "name":"Dueling", "description":"Deal 5 damage", "damage":5, "shield":0},
	{"type":"business", "cost":3, "name":"Great Weapons Fighting", "description":"Heavy weapons, deal 16 damage", "damage":16, "shield":0},
	{"type":"business", "cost":7, "name":"Raw Damage", "description":"Pure brute force, deal 38 damage", "damage":38, "shield":0},
	{"type":"business", "cost":2, "name":"Defense", "description":"Use shield and gain +15 defense", "damage":0, "shield":15},
	{"type":"business", "cost":5, "name":"Warriors Armor", "description":"Use shield and gain +6 defense", "damage":0, "shield":6},
	{"type":"business", "cost":1, "name":"Dueling", "description":"Deal 5 damage", "damage":5, "shield":0},
	{"type":"business", "cost":10, "name":"Shield Wall", "description":"Invoque a wall of shields and gain +60 defense", "damage":0, "shield":60},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"quality", "cost":8, "name":"Double Effect", "description":"Double the effect of your next card", "multiply":2, "plus":0},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"data", "cost":9, "name":"Sight", "description":"Know your opponents next +1 attack for the entire match", "dataCards":0, "dataEnemy":1},
	{"type":"data", "cost":1, "name":"Foreshadowing", "description":"View your opponents next attack during this round", "dataCards":0, "dataEnemy":1},
	{"type":"data", "cost":5, "name":"Revelations", "description":"View the 5 next attacks of your opponent", "dataCards":0, "dataEnemy":5},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"business", "cost":1, "name":"Dueling", "description":"Deal 5 damage", "damage":5, "shield":0},
	{"type":"business", "cost":3, "name":"Great Weapons Fighting", "description":"Heavy weapons, deal 16 damage", "damage":16, "shield":0},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"business", "cost":1, "name":"Dueling", "description":"Deal 5 damage", "damage":5, "shield":0},
	{"type":"business", "cost":3, "name":"Great Weapons Fighting", "description":"Heavy weapons, deal 16 damage", "damage":16, "shield":0},
	{"type":"vision", "cost":2, "name":"Lay on hands", "description":"Heal 12 health", "heal":12, "plus":0},
	{"type":"vision", "cost":15, "name":"Divine Smite", "description":"Your god gives you strength for your next move, add +50 to your next attack", "heal":0, "plus":50},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"},
	{"type":"quality", "cost":8, "name":"Double Effect", "description":"Double the effect of your next card", "multiply":2, "plus":0},
	{"type":"deployment", "cost":0, "name":"Deployment", "description":"The process of encreation"}
]

# These two are used for alternating between Dimensions and Cards scenes
var returnToDimensions = false
var goToCards = false
var clearDimensions = false
var goToInfo = false
var goToInfoSelection = false
var sceneToReturnTo = ""


#Texts explaining the dimension
var dimensionTexts = {
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

