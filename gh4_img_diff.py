#!/usr/bin/env python

import os, sys
import numpy as np
import cv2
import json


# returns list of contiguous points that are different between two images of equal size
def get_diffs( file_img1, file_img2, min_pts ):
    # CHECK: file existence
    if not (os.path.isfile(file_img1) and os.path.isfile(file_img2)):
        return -1

    # read in images
    img1 = cv2.imread( file_img1 )
    img2 = cv2.imread( file_img2 )

    # CHECK: img size equality
    if img1.shape != img2.shape:
        return -2

    # get threshold of the difference between the images
    ret, im_diff = cv2.threshold( (img1 - img2), 0,255, cv2.THRESH_BINARY)

    # collapse image into single channel
    im_diff = cv2.add(cv2.split(im_diff)[0],cv2.split(im_diff)[1],cv2.split(im_diff)[2])

    # find groups of contiguous points where images are different
    cont, _ = cv2.findContours( im_diff, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE )

    # put all contours with more than min_pts points into JSON 
    d = {'diff':[]}
    for c in cont:
        if len(c) > min_pts:
            d['diff'].append([[int(n) for n in p[0]] for p in c ])

    # dump JSON to stdout
    json.dump(d,sys.stdout)


# run get_diffs by default
if __name__=='__main__':
    get_diffs(sys.argv[1],sys.argv[2],min_pts=3)

