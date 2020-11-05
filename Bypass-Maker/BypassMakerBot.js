const FileSystem = require("fs"); // make a temp file
const Exec = require('child_process').exec; // cmd 
const Https = require("https") // Get File Data
const DiscordJs = require("discord.js"); // Discord Lib
const Client = new DiscordJs.Client()
const Prefix = "?"
var Commands = []
const MethodEmbed = new DiscordJs.MessageEmbed()
.setColor('#8f0000')
.setTitle('Method Bot')
.setURL("https://github.com/Not-Cyrus")
.setDescription("1")
.addFields(
    {name: '2', value: '3', inline: true},
)

async function CommandToRun(Command){
    return new Promise(function(resolve,reject){
        Exec(Command,(Error,Out,Error2) => {
            if (Error){reject(Error)}
            resolve({Out,Error2})
        })
    })
}

function AddCommand(Func,Name){
    Commands[Commands.length] = {"Func": Func,"Name": Name}
}

function FindCommand(CommandName){
    for (let Command in Commands){
        if (Commands[Command].Name === CommandName){
            return Commands[Command].Func
        }
    }
}

function CheckCommand(Message){
    let Arguments = Message.content.slice(Prefix.length).trim().split(" ")
    const CommandFound = FindCommand(Arguments.shift())
    if (CommandFound){
        CommandFound(Message,Arguments)
    }
}

function MakeAudio(Message,Bait,Bypass){
    let Id = Message.author.id
    Https.get(Bypass,function(Response){
        var File = FileSystem.createWriteStream("Bypasses\\" + Id + ".ogg")
        Response.pipe(File)
        File.on('finish',async function(){
            await CommandToRun("copy /b " + File.path + "+" + Bait + " Bypasses\\" + Id + ".mp3")
            await CommandToRun("erase /F " + File.path)
            await Message.author.send({files: ["Bypasses\\" + Id + ".mp3"]}).then(function(){
                Message.delete({timeout: 1000})
            }).catch(function(){
                Message.send({files: ["Bypasses\\" + Id + ".mp3"]})
            })
            CommandToRun("erase /F Bypasses\\" + Id + ".mp3")
        })
    })
}

Client.on("ready",() => {Client.user.setActivity("?help")})

Client.on("message",Message => {
    if (Message.content.startsWith(Prefix) && !Message.author.bot && Message.guild){
		CheckCommand(Message)
    }
})

AddCommand(function(Message,Arguments){
    Message.reply(MethodEmbed)
},"help")

AddCommand(function(Message,Arguments){
    let File = Message.attachments.array()[0]
    if (File && File.size <= 7900000 && File.size > 0 && File.name.endsWith(".ogg")){
        let FileExists = FileSystem.existsSync("Baits\\Bait" + Arguments[0] + ".mp3")
        if (FileExists){
			MakeAudio(Message,"Baits\\Bait" + Arguments[0] + ".mp3",File.attachment)
        } else {Message.reply(MethodEmbed)}
    } else {Message.reply("You need a file and the file size needs to be under 7.9 mbs you absolute baboon")}
},"method")

Client.login("Token")