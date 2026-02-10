# Atelier_entrepot_de_donnee_epsi

## Noms de l'équipe
Amel Mansouris  
Maxence Etem  
Nagege Matezer  
Rémi Lhuissier  

## Présentation du Dataset

Nous avons choisi d'utiliser

```mermaid
classDiagram

    class Player {
        PK idPlayer : int
        descPlayerName : string
        dtBirth : date
        descCountry : string
        dtRegistration : date
        flFacebook : boolean
        flTwitter : boolean
        flTwitch : boolean
    }

    class Lobby {
        PK idLobbyGame : int
        idRoom : int
        dtCreatedAt : datetime
    }

    class PlayerStats {
        PK FK idPlayer : int
        PK FK idLobbyGame : int
        qtKill : int
        qtAssist : int
        qtDeath : int
        qtHs : int
        qtDamage : int
        qtShots : int
        qtHits : int
        qtHitHead : int
        qtHitChest : int
        qtHitStomach : int
        qtHitLeftArm : int
        qtHitRightArm : int
        qtHitLeftLeg : int
        qtHitRightLeg : int
        flWinner : boolean
    }

    class Medal {
        PK idMedal : int
        descMedal : string
        descType : string
        qtXp : int
    }

    class PlayerMedal {
        PK FK idPlayer : int
        PK FK idMedal : int
        dtCreatedAt : datetime
        dtExpiredAt : datetime
    }

    %% Associations avec multiplicités

    Player "1" --> "0..*" PlayerStats : plays
    Lobby "1" --> "0..*" PlayerStats : contains

    Player "1" --> "0..*" PlayerMedal : earns
    Medal "1" --> "0..*" PlayerMedal : assigned
```




Lien du dataset : https://www.kaggle.com/datasets/gamersclub/brazilian-csgo-plataform-dataset-by-gamers-club 
