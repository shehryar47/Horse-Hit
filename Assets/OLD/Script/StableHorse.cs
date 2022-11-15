using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StableHorse : MonoBehaviour
{
    // Start is called before the first frame update
    Animator anim;
    void Start()
    {
        anim = GetComponentInChildren<Animator>();
        anim.Play("Idle02");
    }

}
