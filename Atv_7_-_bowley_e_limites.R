library(janitor)
library(readxl)
library(dplyr)
library(lettervalue)
library(KbMvtSkew)
library(e1071)

library(tidyverse)

## n = 1000
## 
##                                  amostra                    
##                        ---------------------------
## M 500.5 (profundidade) |          95.54          |
## F 250.5 (profundidade) | 90.54             98.14 |
## 1 1 (profundidade)     | 54.22             100   |

# O coeficiente de bowley é calculado da seguinte forma: 
# Bowley = (Q3+Q1−2*Q2 / Q3−Q1)

Bowley <- ((98.14 + 90.54 - 2*(95.54)) / (98.14 - 90.54))

Bowley

# Diferença de quartis: 
# • F-spread é calculadod a seguinte forma:
# dF = FU − FL, onde FU é o terceiro quartil e FL é o
# primeiro quartil;

f_spread <- (98.14 - 90.54)

# F-pseudo sigma é calculado da seguinte forma (dF/ 1,379).

f_pseudo_sigma <- f_spread / 1.349

f_pseudo_sigma

# f-pseudo variancia:

f_pseudo_variance <- f_pseudo_sigma^2

f_pseudo_variance

# Trimédia: (Q1 + 2*Q2 + Q3) / 4
trimedians <- (90.54 + 2*95.54 + 98.14) / 4

trimedians

# Limite inferior: 1,5*dF - Q1

LI <- (90.54 - 1.5*f_spread)

LI
 
# Limite superior: 1,5*dF + Q3

LS <- (98.14 + 1.5*f_spread)

LS


# SEGUNDA quest -----------------------------------------------------------

# Q1 = 1.835
# Q2 = 4.560
# Q3 = 9.010

# Sb= (Q3+Q1−2*Q2 / Q3−Q1)

Bowley <- ((9.010 + 1.835 - 2*(4.560)) / (9.010 - 1.835))

# distancia entre quartis:

f_spread <- (9.010 - 1.835)
f_spread

# f-sigma:

f_sigma <- f_spread / 1.359

f_sigma

# pseudo variance:

f_pseudo_variance <- f_sigma^2

f_pseudo_variance

# Trimédia: (Q1 + 2*Q2 + Q3) / 4

trimedia <- (1.835 + 2*(4.560) + 9.010) / 4
  
trimedia

# Limite inferior:

LI <- (1.835 - 1.5*f_spread)
LI

# Limite Superior:

LS <-  (9.010 + 1.5*f_spread)
LS

