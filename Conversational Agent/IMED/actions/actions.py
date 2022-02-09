from typing import Any, Text, Dict, List
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher


class ActionSetScore(Action):

    def name(self) -> Text:
        return "action_calculating"

    def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
   #Initiated at the beginnng of conversation
        all_intents = 26
        key_intents = ['wherePain','painType','painChange','painSymptoms','painType2','hematesisMain','hematesisMore','stoolGeneral','stoolBlack','stoolFeatures','anaemiaFatigue','anaemiaHeart','anaemiaDaze','anaemiaNone']
        print(key_intents)
        print(len(key_intents))
    #    -> List[EventType]:
        for score in intent:
            intent = tracker.get_intent_of_latest_message
            score = len(intent)* 5
        
        dispatcher.utter_message("Bye" \ + "Your Score is".format(score))
        return []

        
 