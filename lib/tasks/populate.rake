namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    100.times do |n|
      puts "[DEBUG] creating job #{n+1} of 100"
      number = Faker::Number.number(5)
      customer = ['Sea World', 'MTA', 'LADWP', 'SCE', 'Johnson Controls', 'Occidental Oil', 'California Steel Industries', 'Schlumberger', 'Haliburton', 'Chevron', 'Siemens']
      equipment = ['Aerzen', 'Amarillo', 'Bonfiglioli', 'Borg Warner', 'Brook Hansen', 'Braner', 'Camco', 'Cavex', 'Chemineer', 'Cincinatti', 'Cincinatti Milacron', 'Cone Drive', 'Cotta', 'Cyclo', 'David Brown', 'Delaval', 'Delta', 'Demag', 'Desch', 'Dodge', 'Doerr', 'Dorr-oliver', 'Dresser Rand', 'Durco', 'Envirotech', 'Euro-drive', 'Gardner Denver', 'Falk', 'Farrel', 'Fenner', 'Flender', 'Flygt', 'Foote-jones', 'Framo', 'GE – General Electric', 'Geneva', 'Hansen', 'Helical', 'Henke', 'Heurth', 'Hitachi', 'Hoffman', 'Holroyd', 'Hub City', 'Hydro', 'Hydro-mec', 'Ihi', 'Illinois Gear', 'Ingersoll Rand', 'Iron Works', 'Iserlohn', 'Isubaki', 'Johnson Gear', 'Kone', 'Krupp', 'Lenze', 'Leroy-somer', 'Liebherr', 'Lightnin', 'Link-belt', 'Locker-rotex', 'Lufkin', 'Lyon', 'Marley', 'Masson', 'Milwaukee', 'Mitsubishi', 'Morse', 'Moventas', 'Nord', 'Norwinch', 'P & H', 'Pacific', 'Paramax', 'Parker', 'Peerless', 'Philadelphia', 'Peiner', 'Radicon', 'Rauma', 'Repola', 'Redex', 'Reggiana', 'Renk Zanini', 'Renold', 'Rexnord', 'Roots', 'Sadem Herr-voss', 'Santasalo', 'Sew', 'Siemens', 'Siemens Elmo', 'Solar', 'Sulzer', 'Sumitomo Mhi', 'Tandler', 'Terry', 'Textron Cone-drive', 'Thyssen', 'Toyo', 'Twin Disc', 'U.S. Motors', 'Valmet', 'Van Doorne', 'Vector', 'Vickers', 'Vogel', 'Voith Turbo', 'Volda', 'Vulkan', 'Wagner', 'Wapco', 'Wartsila', 'Weiler', 'Weir', 'Werner', 'Weserhutte', 'Western', 'Westech', 'Westinghouse', 'Winergy', 'Winsmith', 'Worthington']
      notes = Faker::Lorem.sentence
      Job.create!( number: number,
                    customer: customer.sample,
                    equipment: equipment.sample,
                    notes: notes)
    end

    Job.all.each do |job|
      puts "[DEBUG] uploading images for job #{job.id} of #{Job.last.id}"
      5.times do |n|
        url = File.basename(Dir.glob(File.join(Rails.root, 'pamco', '*')).sample)
        job.images.create!(url: url)
      end
    end
  end
end