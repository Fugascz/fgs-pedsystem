USE_KEYMAPPING = true

PED_MODELS = {
    ['DOG'] = {
        [1] = {
            LABEL = 'CHOP',
            MODEL ='a_c_chop',
        },
        [2] = {
            LABEL = 'HUSKY',
            MODEL ='a_c_husky',
        },
        [3] = {
            LABEL = 'POODLE',
            MODEL = 'a_c_poodle',
        },
        [4] = {
            LABEL = 'PUG',
            MODEL = 'a_c_pug',
        },
        [5] = {
            LABEL = 'RETRIEVER',
            MODEL ='a_c_retriever', 
        },
        [6] = {
            LABEL = 'ROTTWEILER',
            MODEL ='a_c_rottweiler', 
        },
        [7] = {
            LABEL = 'SHEPHERD',
            MODEL ='a_c_shepherd', 
        },
        [8] = {
            LABEL = 'WESTY',
            MODEL ='a_c_westy', 
        },
    },
    ['NPC'] = {
        [1] = {
            LABEL = 'ANDREAS',
            MODEL ='cs_andreas', 
        },
        [2] = {
            LABEL = 'ANTONIA',
            MODEL ='cs_antonia', 
        },
        [3] = {
            LABEL = 'BEVERLY',
            MODEL ='cs_beverly', 
        },
        [4] = {
            LABEL = 'BRAD',
            MODEL ='cs_brad', 
        },
        [5] = {
            LABEL = 'BRAD',
            MODEL ='cs_bradcadaver', 
        },
        [6] = {
            LABEL = 'BRUCE',
            MODEL ='cs_bruce', 
        },
        [7] = {
            LABEL = 'CARLOS',
            MODEL ='cs_carlos', 
        },
    } 
}

DOG_ANIMATIONS = {
    [1] = {
        LABEL = 'Sednout',
        ANIM = 'creatures@rottweiler@amb@world_dog_sitting@base',
        ANIM_DICT = 'base',
    },
    [2] = {
        LABEL = 'Lehnout',
        ANIM_DICT = 'sleep_in_kennel',
        ANIM = 'creatures@rottweiler@amb@sleep_in_kennel@',
    },
    [3] = {
        LABEL = 'Škrábat',
        ANIM_DICT = 'idle_a',
        ANIM = 'creatures@rottweiler@amb@world_dog_sitting@idle_a',
    },
    [4] = {
        LABEL = 'Skákat',
        ANIM_DICT = 'beg_loop',
        ANIM = 'creatures@rottweiler@tricks@',
    },
    [5] = {
        LABEL = 'Podat packu',
        ANIM_DICT = 'paw_right_loop',
        ANIM = 'creatures@rottweiler@tricks@',
    },
    [6] = {
        LABEL = 'Štěknout',
        ANIM_DICT = 'idle_a',
        ANIM = 'creatures@rottweiler@amb@world_dog_barking@idle_a',
    },
    [7] = {
        LABEL = 'Upozornit',
        ANIM_DICT = 'indicate_high',
        ANIM = 'creatures@rottweiler@indication@',
    },
    [8] = {
        LABEL = 'Plavat',
        ANIM_DICT = 'swim',
        ANIM = 'creatures@rottweiler@swim@',
    },
}