using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CancelRank : MonoBehaviour
{
    public Temp temp;
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Horse"))
        {
            temp.CancelInvoke("RankingSystem");
            Patrol.hasReachedLast = true;
        }
    }
}
