admin = Team.create({name: 'admin'})
boss = Team.create({name: 'boss'})
teamleader = Team.create({name: 'teamleader'})
employee = Team.create({name: 'employee'})
User.create({ name: 'admin',
 lastname: 'admin',
 email: 'admin11@gmail.com',
 password: 'nikoniko',
 role: 'admin',
 team_id: admin.id })
User.create({ name: 'boss',
 lastname: 'boss',
 email: 'boss11@gmail.com',
 password: 'nikoniko',
 role: 'boss',
 team_id: boss.id })
User.create({ name: 'teamleader',
 lastname: 'teamleader',
 email: 'teamleader@gmail.com',
 password: 'nikoniko',
 role: 'teamleader',
 team_id: teamleader.id })
User.create({ name: 'employee',
 lastname: 'employee',
 email: 'employee@gmail.com',
 password: 'nikoniko',
 role: 'employee',
 team_id: employee.id })
