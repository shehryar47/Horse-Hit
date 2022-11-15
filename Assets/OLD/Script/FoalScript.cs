using UnityEngine;

public class FoalScript : MonoBehaviour
{
    public Animation anim;
    public string animationName;

    public static FoalScript Ins;
    public int Growth ;
    // Start is called before the first frame update
    void Start()
    {
        Ins = this;
        if (anim = GetComponent<Animation>())
        {

            anim = GetComponent<Animation>();
        }
        else
        {
            anim = GetComponentInChildren<Animation>();
        }
    }
    public void Growthh()
    {
        Growth++;
        if(Growth==3)
        {
            return;
        }
    }

    // Update is called once per frame
    void Update()
    {
        // anim.Play("idle");
        //anim.Play();

    }

    public void Animat()
    {
        anim.Play("Eating");
    }
}
