using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FeedingController : MonoBehaviour
{
    public GameObject BabyHorse;
    public GameObject Hay;
    public ParticleSystem ParticalEffect;
    public Animator Feeding;
    bool flag;
   
    // Start is called before the first frame update
    float x;

    private void Start()
    {
        ParticalEffect.Stop();
    }
    // Update is called once per frame
    void Update()
    {
        
    }

    public void FeedindButton()
    {
        x = x + 0.25f;
        if(x < 0.8)
        {
            flag = false;
          //  StartCoroutine(Grow(x));
        BabyHorse.transform.GetComponent<Transform>().localScale = new Vector3(x, x, x);
        Feeding.Play("feeding");
        ParticalEffect.Play();
        Hay.SetActive(true);
            Invoke("HayFalse",1f);
        }
        else 
        {
            Debug.Log("NOTHING");
        }
    }

    IEnumerator Grow(float x)
    {
        if(!flag)
        {
        while(x < 0.8)
        {
         flag = true;
        
        yield return new WaitForSeconds(0.5f);
        }

        }
   
        
    }
    public void HayFalse()
    {
        Hay.SetActive(false); 
    }
}
