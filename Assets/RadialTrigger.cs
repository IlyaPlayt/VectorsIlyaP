using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class RadialTrigger : MonoBehaviour
{
    [SerializeField] private float radius;
    public Transform targetPoint;

    private void OnDrawGizmos()
    {
        Vector3 vectroToTarget = targetPoint.position - transform.position;

        Gizmos.DrawRay(transform.position, vectroToTarget.normalized);
        // if (vectroToTarget.magnitude <= radius)
        // {
        //     Handles.color=Color.red;
        // }
        // else
        // {
        //     Handles.color=Color.white;
        // }

        if (Mathf.Sqrt(vectroToTarget.x * vectroToTarget.x + vectroToTarget.y * vectroToTarget.y) <= radius)
        {
            Handles.color=Color.red;
        }
        else
        {
            Handles.color=Color.white;
        } 

        Handles.DrawWireDisc(transform.position, transform.forward, radius);
  }
}
