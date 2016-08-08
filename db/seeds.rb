

require 'csv'

namespace :startups do
	desc "import startups from lib/seeds/StartupList.csv"
	task import: :environment do
		file = Rails.root.join("lib","seeds","StartupList.csv")
		CSV.foreach(file, headers: true, return_headers: false, header_converters: :symbol) do |row|
			# CSV contains multiple verticals per startup. Your model only supports one vertical per startup.
			verticals = row[:vertical]

			next if verticals.nil?
			vertical = verticals.is_a?(String)  ? verticals.capitalize : verticals.first.capitalize
			Startup.create!(
			name: row[:company_name],
			website: row[:website],
			address: row[:address],
			latitude: row[:latutide],
			longitude: row[:longitude],
			description: row[:description],
			vertical: vertical,
			employee_count: row[:employee_count],
			stage: row[:stage],
			founded_date: row[:date_added]
			)
		end
	end

end



# p csv
Investor.create!(name:'Citibank', address:'Miami, FL', latitude: '25.9451', longitude: '-80.1961', shortdescription: 'company short description', founded_date: '01/02/2000', website: 'http://www.wyncode.co', approval: true, email: 'aa@aa.com', description: 'long long long description long long long descriptionlong long long descriptionlong long long description', vertical: 1)
Investor.create!(name:'Mario', address:'Miami, FL', latitude: '25.6551', longitude: '-80.1981', shortdescription: 'company short description', founded_date: '01/02/2000', website: 'http://www.wyncode.co', approval: true, email: 'aa@aa.com', description: 'long long long description long long long descriptionlong long long descriptionlong long long description', vertical: 2)
Investor.create!(name:'HSBC', address:'Orlando, FL', latitude: '26.7539', longitude: '-81.5747', shortdescription: 'company short description', founded_date: '01/02/2000', website: 'http://www.wyncode.co', approval: true, email: 'aa@aa.com', description: 'long long long description long long long descriptionlong long long descriptionlong long long description', vertical: 3)
Investor.create!(name:'Fundation', address:'Tampa, FL', latitude: '27.9354', longitude: '-82.4522', shortdescription: 'company short description', founded_date: '01/02/2000', website: 'http://www.wyncode.co', approval: true, email: 'aa@aa.com', description: 'long long long description long long long descriptionlong long long descriptionlong long long description', vertical: 2)
Investor.create!(name:'University of Miami', address:'Orlando, FL', latitude: '26.5752', longitude: '-81.9325', shortdescription: 'company short description', founded_date: '01/02/2000', website: 'http://www.wyncode.co', approval: true, email: 'aa@aa.com', description: 'long long long description long long long descriptionlong long long descriptionlong long long description', vertical: 1)

#Startups I manually typed in case something goes wrong!

# Startup.create!(name:"InnFocus Inc", website:"http://innfocusinc.com", address:"12415 SW 136th Ave #3, Miami, FL 33186", latitude:"25.65129", longitude:"-80.415978", description:"InnFocus is an ophthalmology company with extensive biomaterials experience, which develops and provides next-generation products for glaucoma surgery.", vertical: 2, employee_count:"16", stage:"C", founded_date:"11-05-2013", approval: true)
#
# Startup.create!(name:"Open English", website:"http://openenglish.com", address:"2901 Florida Ave #840, Miami, FL 33133", latitude:"25.72941", longitude:"-80.2429445", description:"Open English is a leading Education Technology company focused on English language learning for the Latin American & U.S. Hispanic markets.", vertical: 8, employee_count:"898", stage:"Late", founded_date:"04-04-2013", approval: true)
#
# Startup.create!(name:"Shooger", website:"http://shooger.com", address:"3211 Ponce De Leon Blvd #101, Coral Gables, FL 33134", latitude:"25.7488508", longitude:"-80.2672069", description:"Shooger is a mobile marketing platform that enables merchants to connect with smartphone-savvy consumers.", vertical: 18, employee_count:"32", stage:"A", founded_date:"04-04-2013", approval: true)
#
# Startup.create!(name:"Tissuetech", website:"http://biotissue.com", address:"7000 SW 97th Ave #211, Miami, FL 33173", latitude:"25.7512329", longitude:"-80.4114491", description:"issueTech, Inc., the parent company of both Amniox Medical, Inc. and BioTissue, Inc., is a leader in regenerative amniotic tissue-based products for use in the ophthalmology, optometry, musculoskeletal and wound care markets. The Company’s first product, AmnioGraft®, is the only tissue graft designated by the FDA as homologous for promoting ophthalmic wound healing while suppressing scarring and inflammation.", vertical: 2, employee_count:"43", stage:"B", founded_date:"07-16-2013", approval: true)
#
# Startup.create!(name:"AerSale Holdings", website:"http://aersale.com", address:"121 Alhambra Plaza # 1700, Coral Gables, FL 33134", latitude:"25.7526597", longitude:"-80.2594869", description:"AerSale Holdings provides aftermarket aircraft, engines and component parts to airlines, leasing companies and OEM/MRO service providers.", vertical: 16, employee_count:"193", stage:"Late", founded_date:"04-04-2013", approval: true)
#
# Startup.create!(name:"YellowPepper", website:"http://yellowpepper.com", address:"380 NW 24th St, Miami, FL 33127", latitude:"25.7999069", longitude:"-80.2039922", description:"YellowPepper provides mobile banking and payment solutions to financial institutions in the Latin American region.", vertical: 3, employee_count:"87", stage:"C", founded_date:"04-04-2013", approval: true)
#
# Startup.create!(name:"LiveNinja", website:"http://liveninja.com", address:"120 NW 25th St, Miami, FL 33127", latitude:"25.800524", longitude:"-80.199757", description:"LiveNinja is a live video chat marketplace that connects users with experts in various topics, fields and expertise.", vertical: 3, employee_count:"18", stage:"A", founded_date:"04-04-2013", approval: true)
#
# Startup.create!(name:"Easy Solutions", website:"http://easysol.net", address:"8550 NW 33rd St Suite 101, Doral, FL 33122", latitude:"25.804634", longitude:"-80.337905", description:"Easy Solutions delivers security systems for the detection and prevention of electronic fraud across devices, channels and clouds.", vertical: 20, employee_count:"174", stage:"B", founded_date:"04-04-2013", approval: true)
#
# Startup.create!(name:"Intcomex", website:"http://intcomex.com", address:"83505 NW 107th Ave, Doral, FL 33172", latitude:"25.8062048", longitude:"-80.3697057", description:"Intcomex provides IT products such as self-standing computer systems, PC components, peripherals, power protection and backup devices.", vertical: 13, employee_count:"1046", stage:"Late", founded_date:"04-04-2013", approval: true)
#
# Startup.create!(name:"Home61", website:"http://home61.com", address:"3401 N Miami Ave #210, Miami, FL 33127", latitude:"25.8079606", longitude:"-80.1961227", description:"Home61 is an online real estate brokerage company.", vertical: 21, employee_count:"25", stage:"Pre Series A", founded_date:"01-14-2015", approval: true)
#
# Startup.create!(name:"ClassWallet.com", website:"http://classwallet.com", address:"4141 Northeast 2nd Avenue #203b, Miami, FL 33137", latitude:"25.8142979", longitude:"-80.1929773", description:"A new and better way to collect, spend and track money for classrooms—without handling cash.", vertical: 3, employee_count:"12", stage:"Pre Series A", founded_date:"09-22-2014", approval: true)
#
# Startup.create!(name:"Bridgevine", website:"http://bridgevine.com", address:"9675 NW 117th Ave #405, Miami, FL 33178", latitude:"25.8620774", longitude:"-80.3879696", description:"Bridgevine is the leading customer acquisition solution provider for top home service brands.", vertical: 0, employee_count:"126", stage:"C", founded_date:"04-04-2013", approval: true)
#
# Startup.create!(name:"Brightstar", website:"http://brightstarcorp.com", address:"9725 NW 117th Ave #300, Medley, FL 33178", latitude:"25.8642746", longitude:"-80.3869871", description:"Brightstar provides innovate and best in class solutions to manufacturers, operators and enterprises in the telecommunication industry.", vertical: 17, employee_count:"4093", stage:"Exited (acquired)", founded_date:"04-04-2013", approval: true)
#
# Startup.create!(name:"Nearpod", website:"http://nearpod.com", address:"18305 Biscayne Blvd, Aventura, FL 33160", latitude:"25.8642746", longitude:"-80.1536835", description:"Nearpod is a mobile app that enables teachers to create and share interactive multimedia presentations with their students.", vertical: 17, employee_count:"4093", stage:"Exited (acquired)", founded_date:"04-04-2013", approval: true)
