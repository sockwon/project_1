const userService = require("../services/userService")
const {logger} = require("../logs/config/winston");

const signUp = async(req, res)=> {
try{
    const point = process.env.POINT;
    const {name,username, password, birth, contact, address} = req.body;
    if(!name||!username||!password||!birth||!contact||!address){
       return res.status(400).json({message : 'failed'});
    }
    const userId = await userService.signUp(name,username, password, birth, contact, point);
    await userService.createUserAddress(userId,address);
    return res.status(201).json({message : "success"});
}catch(err){
    return res.status(err.statusCode || 400).json({MESSAGE : err.message})
}   
}

const gettingUserInfo=async(req,res)=>{
    try{
        const {id} = req.body;
        if(!id){
           return res.status(400).json({message : 'failed'});
        }
        const userInfo = await userService.gettingUserInfo(id);
        return res.status(201).json({message : "success", data : userInfo})
    } catch(err) {
        return res.status(err.statusCode || 400).json({MESSAGE : "failed"})
    }
}

const deleteUser=async(req,res)=>{
    try{
        const {username} = req.body;
        if(!username){
        return res.status(400).json({message : 'failed'});
    }
        await userService.deleteUser(username);
        return res.status(204).json({
        message : "success"
    })
    }catch(err){
        return res.status(err.statusCode || 400).json({message : err.MESSAGE})
    }
}

const logIn =async (req,res)=>{
try {
    const {username, password} = req.body;
    if(!username||!password){
        logger.error(`POST / login username:${username} password:${password}`)
        return res.status(400).json({message : 'failed'})
    }
    const token = await userService.logIn(username, password);
    if(token){
        logger.info(`POST / login token:${token !== undefined}`)
        return res.status(201).json({message : "success", token : token});
    }
    return res.status(400).json({message : "failed"});
}catch(err){
    logger.error(`POST / login err.code:${err.statusCode}`)
    return res.status(err.statusCode || 400).json({message : err.MESSAGE})
    }
}

const findUserAddress=async(req,res)=>{
    try{
        const {id} = req.body;
        const userAddress = await userService.findUserAddress(id);
        return res.status(201).json({MESSAGE : "success", data : userAddress});
    }catch(err){
        return res.status(400).json({message : "failed"})
    }
}

module.exports = {
    signUp,gettingUserInfo,deleteUser,logIn,findUserAddress
}