BaseCtrl = require('./BaseCtrl')

class SessionCtrl

    getSession: (req, res) ->
        console.log 'req user data values: ', req.user.dataValues
        session =
            user: req.user?.dataValues
        res.status(200).send data: session


module.exports = SessionCtrl