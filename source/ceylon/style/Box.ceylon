import ceylon.style.type { StyleSize }


shared alias FourSizedBox => [StyleSize, StyleSize, StyleSize, StyleSize];

shared alias EqTwoSizedBox => [StyleSize, StyleSize];

shared alias Box => FourSizedBox | EqTwoSizedBox | StyleSize;
