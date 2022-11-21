using System.Collections;
using UnityEngine;

public class HorseLoad : MonoBehaviour
{
    public Transform Parent;
    public GameObject horse;
    void Awake()
    {
        /*if (SaveGame.GetTotalHorses() == 0)
        {
            SaveGame.SetTotalHorses();
        }
        for (int i = 0; i < SaveGame.GetTotalHorses(); i++)
        {
            GameObject horses = Instantiate(horse) as GameObject;

            horses.transform.parent = Parent;
        }*/
        
    }

    


}
