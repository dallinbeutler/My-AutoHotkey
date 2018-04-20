/*
OverusedWords.ahk by Jack Dunning, October 31, 2015
Written for the blog https://wordpress.com/stats/day/jacksautohotkeyblog.wordpress.com

More free AutoHotkey scripts can be found at:
http://www.computoredge.com/AutoHotkey/Free_AutoHotkey_Scripts_and_Apps_for_Learning_and_Generating_Ideas.html

Beginning AutoHotkey books are available at:
http://www.computoredgebooks.com/AutoHotkey-E-Books_c19.htm?sourceCode=OverusedWords

This script is intended for educational purposes when writing papers for school. The words which prompt the pop-up menus are taken from a list of commonly overused English words provided at http://larae.net/write/synonyms.html. A few more were added from various other sites.

Once the AutoHotkey script is loaded, a pop-up menu will display whenever one of the words is typed then followed with a space. The terminating character can be changed by setting a new value to the variable LastChar. Be sure to escape special characters (e.g. `t, `!, etc.) with the backtick `. Unless using a variable such as A_Space, be sure to enclose the new character with double quotes ("`!").

Whenever doing regular work such as e-mail and other daily editing, it's recommended that you "Suspend" the script by right-clicking on the icon in the System Tray and selecting "Suspend." Otherwise, the pop-ups will drive you crazy.

This is merely a first stab at creating a working "OverusedWords.ahk" app. You may want to introduce numerous changes to suit your needs.

*/

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

LastChar := A_Space

:B0:but::
If A_EndChar = %LastChar%
    WordMenu(4,"nevertheless,nonetheless,however,still
    ,yet,though,although,even so,for all that
    ,despite that,in spite of that,anyway,anyhow
    ,be that as it may,all the same,having said that,notwithstanding")
Return

:B0:amazing::
If A_EndChar = %LastChar%
    WordMenu(8,"incredible,unbelievable,improbable,fabulous,wonderful,fantastic,astonishing,astounding,extraordinary")
Return

:B0:anger::
If A_EndChar = %LastChar%
    WordMenu(6,"enrage,infuriate,arouse,nettle,exasperate,inflame,madden")
Return

:B0:angry::
If A_EndChar = %LastChar%
    WordMenu(6,"mad,furious,enraged,excited,wrathful,indignant,exasperated,aroused,inflamed")
Return

:B0:answer::
If A_EndChar = %LastChar%
    WordMenu(7,"reply,respond,retort,acknowledge")
Return

:B0:ask::
If A_EndChar = %LastChar%
    WordMenu(4,"question,inquire of,seek information from,put a question to,demand,request,expect,inquire,query,interrogate,examine,quiz")
Return

:B0:awful::
If A_EndChar = %LastChar%
    WordMenu(6,"dreadful,terrible,abominable,bad,poor,unpleasant")
Return

:B0:bad::
If A_EndChar = %LastChar%
    WordMenu(4,"evil,immoral,wicked,corrupt,sinful,depraved,rotten,contaminated,spoiled,tainted,harmful,injurious,unfavorable,defective,inferior,imperfect,substandard,faulty,improper,inappropriate,unsuitable,disagreeable,unpleasant,cross,nasty,unfriendly,irascible,horrible,atrocious,outrageous,scandalous,infamous,wrong,noxious,sinister,putrid,snide,deplorable,dismal,gross,heinous,nefarious,base,obnoxious,detestable,despicable,contemptible,foul,rank,ghastly,execrable")
Return

:B0:Beautiful::
If A_EndChar = %LastChar%
    WordMenu(10,"pretty,lovely,handsome,attractive,gorgeous,dazzling,splendid,magnificent,comely,fair,ravishing,graceful,elegant,fine,exquisite,aesthetic,pleasing,shapely,delicate,stunning,glorious,heavenly,resplendent,radiant,glowing,blooming,sparkling")
Return

:B0:begin::
If A_EndChar = %LastChar%
    WordMenu(6,"start,open,launch,initiate,commence,inaugurate,originate")
Return

:B0:big::
If A_EndChar = %LastChar%
    WordMenu(4,"enormous,huge,immense,gigantic,vast,colossal,gargantuan,large,sizable,grand,great,tall,substantial,mammoth,astronomical,ample,broad,expansive,spacious,stout,tremendous,titanic,mountainous")
Return

:B0:brave::
If A_EndChar = %LastChar%
    WordMenu(6,"courageous,fearless,dauntless,intrepid,plucky,daring,heroic,valorous,audacious,bold,gallant,valiant,doughty,mettlesome")
Return

:B0:break::
If A_EndChar = %LastChar%
    WordMenu(6,"fracture,rupture,shatter,smash,wreck,crash,demolish,atomize")
Return

:B0:bright::
If A_EndChar = %LastChar%
    WordMenu(7,"shining,shiny,gleaming,brilliant,sparkling,shimmering,radiant,vivid,colorful,lustrous,luminous,incandescent,intelligent,knowing,quick-witted,smart,intellectual")
Return

:B0:calm::
If A_EndChar = %LastChar%
    WordMenu(5,"quiet,peaceful,still,tranquil,mild,serene,smooth,composed,collected,unruffled,level-headed,unexcited,detached,aloof")
Return

:B0:come::
If A_EndChar = %LastChar%
    WordMenu(5,"approach,advance,near,arrive,reach")
Return

:B0:cool::
If A_EndChar = %LastChar%
    WordMenu(5,"chilly,cold,frosty,wintry,icy,frigid")
Return

:B0:crooked::
If A_EndChar = %LastChar%
    WordMenu(8,"bent,twisted,curved,hooked,zigzag")
Return

:B0:cry::
If A_EndChar = %LastChar%
    WordMenu(4,"shout,yell,yowl,scream,roar,bellow,weep,wail,sob,bawl")
Return

:B0:cut::
If A_EndChar = %LastChar%
    WordMenu(4,"gash,slash,prick,nick,sever,slice,carve,cleave,slit,chop,crop,lop,reduce")
Return

:B0:dangerous::
If A_EndChar = %LastChar%
    WordMenu(10,"perilous,hazardous,risky,uncertain,unsafe")
Return


:B0:dark::
If A_EndChar = %LastChar%
    WordMenu(5,"shadowy,unlit,murky,gloomy,dim,dusky,shaded,sunless,black,dismal,sad")
Return

:B0:decide::
If A_EndChar = %LastChar%
    WordMenu(7,"determine,settle,choose,resolve")
Return

:B0:definite::
If A_EndChar = %LastChar%
    WordMenu(9,"certain,sure,positive,determined,clear,distinct,obvious")
Return

:B0:delicious::
If A_EndChar = %LastChar%
    WordMenu(10,"savory,delectable,appetizing,luscious,scrumptious,palatable,delightful,enjoyable,toothsome,exquisite")

:B0:describe::
If A_EndChar = %LastChar%
    WordMenu(9,"portray,characterize,picture,narrate,relate,recount,represent,report,record")
Return

:B0:destroy::
If A_EndChar = %LastChar%
    WordMenu(8,"ruin,demolish,raze,waste,kill,slay,end,extinguish")
Return

:B0:difference::
If A_EndChar = %LastChar%
    WordMenu(11,"disagreement,inequity,contrast,dissimilarity,incompatibility")
Return
:B0:do::
If A_EndChar = %LastChar%
    WordMenu(3,"execute,enact,carry out,finish,conclude,effect,accomplish,achieve,attain")
Return

:B0:dull::
If A_EndChar = %LastChar%
    WordMenu(5,"boring,tiring,tiresome,uninteresting,slow,dumb,stupid,unimaginative,lifeless,dead,insensible,tedious,wearisome,listless,expressionless,plain,monotonous,humdrum,dreary")
Return

:B0:eager::
If A_EndChar = %LastChar%
    WordMenu(6,"keen,fervent,enthusiastic,involved,interested,alive to")
Return

:B0:end::
If A_EndChar = %LastChar%
    WordMenu(4,"stop,finish,terminate,conclude,close,halt,cessation,discontinuance")
Return

:B0:Explain::
If A_EndChar = %LastChar%
    WordMenu(8,"elaborate,clarify,define,interpret,justify,account for")
Return

:B0:fair::
If A_EndChar = %LastChar%
    WordMenu(5,"just,impartial,unbiased,objective,unprejudiced,honest")
Return

:B0:fall::
If A_EndChar = %LastChar%
    WordMenu(5,"drop,descend,plunge,topple,tumble")
Return

:B0:false::
If A_EndChar = %LastChar%
    WordMenu(6,"fake,fraudulent,counterfeit,spurious,untrue,unfounded,erroneous,deceptive,groundless,fallacious")
Return

:B0:famous::
If A_EndChar = %LastChar%
    WordMenu(7,"well-known,renowned,celebrated,famed,eminent,illustrious,distinguished,noted,notorious")
Return

:B0:fast::
If A_EndChar = %LastChar%
    WordMenu(5,"quick,rapid,speedy,fleet,hasty,snappy,mercurial,swiftly,rapidly,quickly,snappily,speedily,lickety-split,posthaste,hastily,expeditiously,like a flash")
Return

:B0:fat::
If A_EndChar = %LastChar%
    WordMenu(4,"stout,corpulent,fleshy,beefy,paunchy,plump,full,rotund,tubby,pudgy,chubby,chunky,burly,bulky,elephantine")
Return

:B0:fear::
If A_EndChar = %LastChar%
    WordMenu(5,"fright,dread,terror,alarm,dismay,anxiety,scare,awe,horror,panic,apprehension")
Return

:B0:fly::
If A_EndChar = %LastChar%
    WordMenu(4,"soar,hover,flit,wing,flee,waft,glide,coast,skim,sail,cruise")
Return

:B0:funny::
If A_EndChar = %LastChar%
    WordMenu(6,"humorous,amusing,droll,comic,comical,laughable,silly")
Return

:B0:get::
If A_EndChar = %LastChar%
    WordMenu(4,"acquire,obtain,secure,procure,gain,fetch,find,score,accumulate,win,earn,rep,catch,net,bag,derive,collect,gather,glean,pick up,accept,come by,regain,salvage")
Return

:B0:go::
If A_EndChar = %LastChar%
    WordMenu(3,"recede,depart,fade,disappear,move,travel,proceed")
Return

:B0:good::
If A_EndChar = %LastChar%
    WordMenu(5,"excellent,fine,superior,wonderful,marvelous,qualified,suited,suitable,apt,proper,capable,generous,kindly,friendly,gracious,obliging,pleasant,agreeable,pleasurable,satisfactory,well-behaved,obedient,honorable,reliable,trustworthy,safe,favorable,profitable,advantageous,righteous,expedient,helpful,valid,genuine,ample,salubrious,estimable,beneficial,splendid,great,noble,worthy,first-rate,top-notch,grand,sterling,superb,respectable,edifying")
Return

:B0:great::
If A_EndChar = %LastChar%
    WordMenu(6,"noteworthy,worthy,distinguished,remarkable,grand,considerable,powerful,much,mighty")
Return

:B0:gross::
If A_EndChar = %LastChar%
    WordMenu(6,"improper,rude,coarse,indecent,crude,vulgar,outrageous,extreme,grievous,shameful,uncouth,obscene,low")
Return

:B0:happy::
If A_EndChar = %LastChar%
    WordMenu(6,"pleased,contented,satisfied,delighted,elated,joyful,cheerful,ecstatic,jubilant,gay,tickled,gratified,glad,blissful,overjoyed")
Return

:B0:hate::
If A_EndChar = %LastChar%
    WordMenu(5,"despise,loathe,detest,abhor,disfavor,dislike,disapprove,abominate")
Return

:B0C:have::
If A_EndChar = %LastChar%
    WordMenu(5,"must,need to,am compelled to,am forced to,are compelled to,are forced to,hold,possess,own,contain,acquire,gain,maintain,believe,bear,beget,occupy,absorb,fill,enjoy")
Return

:B0:help::
If A_EndChar = %LastChar%
    WordMenu(5,"aid,assist,support,encourage,back,wait on,attend,serve,relieve,succor,benefit,befriend,abet")
Return

:B0:hide::
If A_EndChar = %LastChar%
    WordMenu(5,"conceal,cover,mask,cloak,camouflage,screen,shroud,veil")
Return

:B0:hurry::
If A_EndChar = %LastChar%
    WordMenu(6,"rush,run,speed,race,hasten,urge,accelerate,bustle")
Return

:B0:hurt::
If A_EndChar = %LastChar%
    WordMenu(5,"damage,harm,injure,wound,distress,afflict,pain")
Return

:B0:idea::
If A_EndChar = %LastChar%
    WordMenu(5,"thought,concept,conception,notion,understanding,opinion,plan,view,belief")
Return

:B0:important::
If A_EndChar = %LastChar%
    WordMenu(10,"necessary,vital,critical,indispensable,valuable,essential,significant,primary,principal,considerable,famous,distinguished,notable,well-known")
Return

:B0:interesting::
If A_EndChar = %LastChar%
    WordMenu(12,"fascinating,engaging,sharp,keen,bright,intelligent,animated,spirited,attractive,inviting,intriguing,provocative,though-provoking,challenging,inspiring,involving,moving,titillating,tantalizing,exciting,entertaining,piquant,lively,racy,spicy,engrossing,absorbing,consuming,gripping,arresting,enthralling,spellbinding,curious,captivating,enchanting,bewitching,appealing")
Return

:B0:keep::
If A_EndChar = %LastChar%
    WordMenu(5,"hold,retain,withhold,preserve,maintain,sustain,support")
Return

:B0:kill::
If A_EndChar = %LastChar%
    WordMenu(5,"slay,execute,assassinate,murder,destroy,cancel,abolish")
Return

 :B0:lazy::
If A_EndChar = %LastChar%
    WordMenu(5,"indolent,slothful,idle,inactive,sluggish")
Return

:B0:little::
If A_EndChar = %LastChar%
    WordMenu(7,"tiny,small,diminutive,shrimp,runt,miniature,puny,exiguous,dinky,cramped,limited,itsy-bitsy,microscopic,slight,petite,minute")
Return

:B0:look::
If A_EndChar = %LastChar%
    WordMenu(5,"gaze,see,glance,watch,survey,study,seek,search for,peek,peep,glimpse,stare,contemplate,examine,gape,ogle,scrutinize,inspect,leer,behold,observe,view,witness,perceive,spy,sight,discover,notice,recognize,peer,eye,gawk,peruse,explore")
Return

:B0:love::
If A_EndChar = %LastChar%
    WordMenu(5,"like,admire,esteem,fancy,care for,cherish,adore,treasure,worship,appreciate,savor")
Return

:B0:make::
If A_EndChar = %LastChar%
    WordMenu(5,"create,originate,invent,beget,form,construct,design,fabricate,manufacture,produce,build,develop,do,effect,execute,compose,perform,accomplish,earn,gain,obtain,acquire,get")
Return

:B0:mark::
If A_EndChar = %LastChar%
    WordMenu(5,"label,tag,price,ticket,impress,effect,trace,imprint,stamp,brand,sign,note,heed,notice,designate")
Return

:B0:mischievous::
If A_EndChar = %LastChar%
    WordMenu(12,"prankish,playful,naughty,roguish,waggish,impish,sportive")
Return

:B0:move::
If A_EndChar = %LastChar%
    WordMenu(5,"plod,go,creep,crawl,inch,poke,drag,toddle,shuffle,trot,dawdle,walk,traipse,mosey,jog,plug,trudge,slump,lumber,trail,lag,run,sprint,trip,bound,hotfoot,high-tail,streak,stride,tear,breeze,whisk,rush,dash,dart,bolt,fling,scamper,scurry,skedaddle,scoot,scuttle,scramble,race,chase,hasten,hurry,hump,gallop,lope,accelerate,stir,budge,travel,wander,roam,journey,trek,ride,spin,slip,glide,slide,slither,coast,flow,sail,saunter,hobble,amble,stagger,paddle,slouch,prance,straggle,meander,perambulate,waddle,wobble,pace,swagger,promenade,lunge")
Return

:B0:moody::
If A_EndChar = %LastChar%
    WordMenu(6,"temperamental,changeable,short-tempered,glum,morose,sullen,mopish,irritable,testy,peevish,fretful,spiteful,sulky,touchy")
Return

:B0:neat::
If A_EndChar = %LastChar%
    WordMenu(5,"clean,orderly,tidy,trim,dapper,natty,smart,elegant,well-organized,super,desirable,spruce,shipshape,well-kept,shapely")
Return

:B0:new::
If A_EndChar = %LastChar%
    WordMenu(4,"fresh,unique,original,unusual,novel,modern,current,recent")
Return

:B0:old::
If A_EndChar = %LastChar%
    WordMenu(4,"feeble,frail,ancient,weak,aged,used,worn,dilapidated,ragged,faded,broken-down,former,old-fashioned,outmoded,passe,veteran,mature,venerable,primitive,traditional,archaic,conventional,customary,stale,musty,obsolete,extinct")
Return

:B0:part::
If A_EndChar = %LastChar%
    WordMenu(5,"portion,share,piece,allotment,section,fraction,fragment")
Return

:B0:place::
If A_EndChar = %LastChar%
    WordMenu(6,"space,area,spot,plot,region,location,situation,position,residence,dwelling,set,site,station,status,state")
Return

:B0:plan::
If A_EndChar = %LastChar%
    WordMenu(5,"plot,scheme,design,draw,map,diagram,procedure,arrangement,intention,device,contrivance,method,way,blueprint")
Return

:B0:popular::
If A_EndChar = %LastChar%
    WordMenu(8,"well-liked,approved,accepted,favorite,celebrated,common,current")
Return

:B0:predicament::
If A_EndChar = %LastChar%
    WordMenu(12,"quandary,dilemma,pickle,problem,plight,spot,scrape,jam")
Return

:B0:put::
If A_EndChar = %LastChar%
    WordMenu(4,"place,set,attach,establish,assign,keep,save,set aside,effect,achieve,do,build")
Return

:B0:quiet::
If A_EndChar = %LastChar%
    WordMenu(6,"silent,still,soundless,mute,tranquil,peaceful,calm,restful")
Return

:B0:right::
If A_EndChar = %LastChar%
    WordMenu(6,"correct,accurate,factual,true,good,just,honest,upright,lawful,moral,proper,suitable,apt,legal,fair")
Return

:B0:run::
If A_EndChar = %LastChar%
    WordMenu(4,"race,speed,hurry,hasten,sprint,dash,rush,escape,elope,flee,load,activate")
Return

:B0:say::
If A_EndChar = %LastChar%
    WordMenu(4,"inform,notify,advise,relate,recount,narrate,explain,reveal,disclose,divulge,declare,command,order,bid,enlighten,instruct,insist,teach,train,direct,issue,remark,converse,speak,affirm,suppose,utter,negate,express,verbalize,voice,articulate,pronounce,deliver,convey,impart,assert,state,allege,mutter,mumble,whisper,sigh,exclaim,yell,sing,yelp,snarl,hiss,grunt,snort,roar,bellow,thunder,boom,scream,shriek,screech,squawk,whine,philosophize,stammer,stutter,lisp,drawl,jabber,protest,announce,swear,vow,content,assure,deny,dispute")
Return

:B0:tell::
If A_EndChar = %LastChar%
    WordMenu(5,"inform,notify,advise,relate,recount,narrate,explain,reveal,disclose,divulge,declare,command,order,bid,enlighten,instruct,insist,teach,train,direct,issue,remark,converse,speak,affirm,suppose,utter,negate,express,verbalize,voice,articulate,pronounce,deliver,convey,impart,assert,state,allege,mutter,mumble,whisper,sigh,exclaim,yell,sing,yelp,snarl,hiss,grunt,snort,roar,bellow,thunder,boom,scream,shriek,screech,squawk,whine,philosophize,stammer,stutter,lisp,drawl,jabber,protest,announce,swear,vow,content,assure,deny,dispute")
Return

:B0:scared::
If A_EndChar = %LastChar%
    WordMenu(7,"afraid,frightened,alarmed,terrified,panicked,fearful,unnerved,insecure,timid,shy,skittish,jumpy,disquieted,worried,vexed,troubled,disturbed,horrified,terrorized,shocked,petrified,haunted,timorous,shrinking,tremulous,stupefied,paralyzed,stunned,apprehensive")
Return

:B0:show::
If A_EndChar = %LastChar%
    WordMenu(5,"display,exhibit,present,note,point to,indicate,explain,reveal,prove,demonstrate,expose")
Return

:B0:slow::
If A_EndChar = %LastChar%
    WordMenu(5,"unhurried,gradual,leisurely,late,behind,tedious,slack")
Return

:B0:stop::
If A_EndChar = %LastChar%
    WordMenu(5,"cease,halt,stay,pause,discontinue,conclude,end,finish,quit")
Return

:B0:story::
If A_EndChar = %LastChar%
    WordMenu(6,"tale,myth,legend,fable,yarn,account,narrative,chronicle,epic,sage,anecdote,record,memoir")
Return

:B0:strange::
If A_EndChar = %LastChar%
    WordMenu(8,"odd,peculiar,unusual,unfamiliar,uncommon,queer,weird,outlandish,curious,unique,exclusive,irregular")
Return

:B0:take::
If A_EndChar = %LastChar%
    WordMenu(5,"hold,catch,seize,grasp,win,capture,acquire,pick,choose,select,prefer,remove,steal,lift,rob,engage,bewitch,purchase,buy,retract,recall,assume,occupy,consume")
Return

:B0:tell::
If A_EndChar = %LastChar%
    WordMenu(5,"disclose,reveal,show,expose,uncover,relate,narrate,inform,advise,explain,divulge,declare,command,order,bid,recount,repeat")
Return

:B0:think::
If A_EndChar = %LastChar%
    WordMenu(6,"judge,deem,assume,believe,consider,contemplate,reflect,mediate")
Return

:B0:trouble::
If A_EndChar = %LastChar%
    WordMenu(8,"distress,anguish,anxiety,worry,wretchedness,pain,danger,peril,disaster,grief,misfortune,difficulty,concern,pains,inconvenience,exertion,effort")
Return

:B0:true::
If A_EndChar = %LastChar%
    WordMenu(5,"accurate,right,proper,precise,exact,valid,genuine,real,actual,trusty,steady,loyal,dependable,sincere,staunch")
Return

:B0:ugly::
If A_EndChar = %LastChar%
    WordMenu(5,"hideous,frightful,frightening,shocking,horrible,unpleasant,monstrous,terrifying,gross,grisly,ghastly,horrid,unsightly,plain,homely,evil,repulsive,repugnant,gruesome")
Return

:B0:unhappy::
If A_EndChar = %LastChar%
    WordMenu(8,"miserable,uncomfortable,wretched,heart-broken,unfortunate,poor,downhearted,sorrowful,depressed,dejected,melancholy,glum,gloomy,dismal,discouraged,sad")
Return

:B0:use::
If A_EndChar = %LastChar%
    WordMenu(4,"employ,utilize,exhaust,spend,expend,consume,exercise")
Return

:B0:very::
If A_EndChar = %LastChar%
    WordMenu(5,"extremely,exceedingly,exceptionally,extraordinarily,tremendously,immensely,hugely,intensely,acutely,abundantly,singularly,uncommonly,decidedly,particularly,supremely,highly,remarkably,really,truly,mightily,ever so,terrifically,awfully,fearfully,terribly,devilishly,majorly,seriously,mega,ultra,damn,damned;dead,real,way,mighty,awful,darned")
Return

:B0:wrong::
If A_EndChar = %LastChar%
    WordMenu(6,"incorrect,inaccurate,mistaken,erroneous,improper,unsuitable")
Return


WordMenu(Spaces,TextOptions)
{
 Global BackSpaces
 BackSpaces := Spaces
 StringSplit, MenuItems, TextOptions , `,
 Loop %MenuItems0%
  {
    Item := MenuItems%A_Index%
    Menu, MyMenu, add, %Item%, WordMenuAction
  }
 Menu, MyMenu, Show
 Menu, MyMenu, DeleteAll
} 

WordMenuAction:
 Check := BackSpaces -1
 SendInput {BackSpace %Check%}
 SendInput {Shift down}{Left}{Shift up}
 OldClipboard:= Clipboard
 Clipboard:= ""
 Send, ^c ;cuts selected text
 ClipWait 0
If Clipboard Is Upper
   {
     First := SubStr(A_ThisMenuItem, 1 , 1)
     Second := SubStr(A_ThisMenuItem, 2)
     Stringupper First, First
     InitialCap := First . Second
     SendInput %InitialCap%{raw}%A_EndChar%
   }
Else
 SendInput %A_ThisMenuItem%{raw}%A_EndChar%
 Clipboard:= OldClipboard
Return