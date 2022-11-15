using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameBreading : MonoBehaviour
{
    public GameObject Horse1;
    public GameObject Horse2;

    public Texture2D[] HTEXT;

    int i;
    int j;  
    Renderer rend;


    // Start is called before the first frame update
    private void Start()
    {
        rend = GetComponent<Renderer>();
       
           
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void TextuerButton()
    {
     
        if(i <= HTEXT.Length)
        {
            Horse1.transform.GetChild(0).transform.GetChild(3).GetComponent<Renderer>().material.mainTexture = HTEXT[i];
            Horse1.transform.GetChild(0).transform.GetChild(4).GetComponent<Renderer>().material.mainTexture = HTEXT[i];
            i++;
            if(i == HTEXT.Length)
            {
                i = 0;
            }
        }
    }

    public void Textuer2Button()
    {
       
        if (j <= HTEXT.Length)
        {
            Horse2.transform.GetChild(0).transform.GetChild(3).GetComponent<Renderer>().material.mainTexture = HTEXT[j];
            Horse2.transform.GetChild(0).transform.GetChild(4).GetComponent<Renderer>().material.mainTexture = HTEXT[j];
            j++;
            if (j == HTEXT.Length)
            {
                j = 0;
            }
        }
    }
}
