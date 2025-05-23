const mysql = require('../routes/mysql')

exports.verificarBrinquedo = async (req, res,next) => {


try{
const resultado = await mysql.execute(
    'SELECT * FROM atracoes WHERE id = ?',
    [req.params.idatracoes]);


if(resultado.length == 0){
    return res.status(404).send({ "mensagem": "Brinquedo não encontrado" });

}
next();
} catch(error){
    return res.status(500).send(error);


}
}



exports.entrarFila = async (req, res,next) => {
    try{
const resultado = await mysql.execute(
    'INSERT INTO hopi_hari_db.users_has_atracoes (user_id,atracoes_id)   VALUES (?,?)',
    [ res.locals.idUsuario, Number(req.params.atracoes_id)]);

 return res.status(201).send({ "mensagem": resultado});

    } catch(error){
        return res.status(500).send(error);


    }
}