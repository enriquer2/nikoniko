t_admin = Team.create({name: 'admin'})
t_boss = Team.create({name: 'boss'})
t_teamleader = Team.create({name: 'teamleader'})
t_employee = Team.create({name: 'employee'})
u1 = User.create({ name: 'admin',
 lastname: 'admin',
 email: 'admin11@gmail.com',
 password: 'nikoniko',
 role: 'admin',
 team_id: t_admin.id })
u2 = User.create({ name: 'boss',
 lastname: 'boss',
 email: 'boss11@gmail.com',
 password: 'nikoniko',
 role: 'boss',
 team_id: t_boss.id })
u3 = User.create({ name: 'teamleader',
 lastname: 'teamleader',
 email: 'teamleader@gmail.com',
 password: 'nikoniko',
 role: 'teamleader',
 team_id: t_teamleader.id })
u4 = User.create({ name: 'employee',
 lastname: 'employee',
 email: 'employee@gmail.com',
 password: 'nikoniko',
 role: 'employee',
 team_id: t_employee.id })
Feeling.create({
  day: '2017/8/23',
  status: 'heaven',
  user: u1 })
Feeling.create({
  day: '2017/8/23',
  status: 'frustrated',
  user: u2 })
Feeling.create({
  day: '2017/8/23',
  status: 'purgatory',
  user: u3 })
Feeling.create({
  day: '2017/8/23',
  status: 'satisfied',
  user: u4 })