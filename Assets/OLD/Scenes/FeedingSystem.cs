using System.Collections;
using UnityEngine;

public class FeedingSystem : MonoBehaviour
{
    public GameObject[] FoalHorse;
    public GameObject PreviousFoal;
    public Animation FoalAnim;
    public GameObject BigHorse;
    public GameObject FeedingButton;
    public GameObject FeedBtn;
    public GameObject Hay;
    public GameObject SelectCam;
    public GameObject[] FeedRLCams;
    public ParticleSystem PufLarge;
    public ParticleSystem PufHay;
    float x = 1f;
    bool Flag;
    int i;
    int z = 0;
    int CamCount;
    // Start is called before the first frame update
    void Start()
    {
        CamCount = 0;
        Flag = true;
        PufLarge.Stop();
        PufHay.Stop();
        // z = FoalHorse.Length;
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void FeedingsyStembutton()
    {

        SelectCam.SetActive(true);
        FeedBtn.SetActive(true);
        PreviousFoal.SetActive(false);

    }
    public void But()
    {
        PufHay.Play();
        Hay.SetActive(true);
        // FoalScript.Ins.Animat();
        FoalHorse[z].GetComponent<FoalScript>().Animat();
        Invoke("FeedTheFoalButton", 5.0f);
    }

    public void FeedTheFoalButton()
    {
        int y = FoalHorse[z].GetComponent<FoalScript>().Growth;
        Debug.Log("z == " + z);
        if (y < 3)
        {
            Hay.SetActive(false);
            PufLarge.Play();
            PufLarge.transform.position = FoalHorse[z].transform.position;
            Hay.transform.position = FoalHorse[z].transform.position;
            // FoalScript.Ins.Animat();
            FoalHorse[z].GetComponent<FoalScript>().Animat();
            Flag = true;

            StartCoroutine(ChangeHorseSize());
            FoalHorse[z].GetComponent<FoalScript>().Growthh();
        }
        else
        {

            FoalHorse[z].transform.GetChild(0).gameObject.SetActive(false);
            FoalHorse[z].transform.GetChild(1).gameObject.SetActive(true);


        }

    }
    public void FeedLeftRightButton(bool RL)
    {

        if (RL)
        {


            FeedRLCams[CamCount].SetActive(true);
            Debug.Log("CamCount11 == " + CamCount);
            z = CamCount;

            if (CamCount >= 3)
            {
                z = 0;
                CamCount = 0;
                FeedRLCams[CamCount].SetActive(true);
                FeedRLCams[CamCount+1].SetActive(false);
                FeedRLCams[CamCount+2].SetActive(false);
                Debug.Log("CamCount11 == " + CamCount);
            }

            CamCount++;



        }
        if (!RL)
        {
            if (CamCount > 0)
            {
                CamCount--;
                z = CamCount;
                FeedRLCams[CamCount].SetActive(false);
                Debug.Log("CamCount22 == " + CamCount);
            }
            if (CamCount == 0)
            {
                z = 0;
            }

        }


    }
    public IEnumerator ChangeHorseSize()
    {

        Invoke("StopFlag", 0.1f);
        while (Flag)
        {
            if (z < FoalHorse.Length)
            {
                print("grow up ");
                FoalHorse[z].transform.GetComponent<Transform>().localScale = new Vector3(x, x, x);
                x = x + 0.01f;
                yield return new WaitForSeconds(0.01f);
            }

        }
    }
    void StopFlag()
    {
        Flag = false;
    }
}
