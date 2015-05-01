from math import sqrt

def read(file):
    data = list()
    with open(file, 'r') as f:
        for line in f:
            # Trenne Zeile nach Whitespace
            s = line.split()
            # Bilde Zahlentupel der Zeile
            t = tuple(int(x) for x in s)
            # Duh
            data.append(t)
    return data

def write(file, data):
    with open(file, 'w') as f:
        for line in data:
            f.write('\t'.join([str(x) for x in line]) + '\n')

def untergrundbereinigung(spektrum, untergrund):
    spek, unt = read(spektrum), read(untergrund)
    ret = list()
    
    for line in zip(spek, unt):
        S, U = line
        
        bin = S[0]
        korrektur = S[1]-U[1]
        
        ds = sqrt(S[1])
        du = sqrt(U[1])
        dkorr = sqrt(ds*ds + du*du)
        
        ret.append((S[0], S[1]-U[1], dkorr))
    
    return ret

def untergrundbereinigung_skaliert(spektrum, untergrund, scale):
    spek, unt = read(spektrum), read(untergrund)
    ret = list()
    
    for line in zip(spek, unt):
        S, U = line
        
        bin = S[0]
        korrektur = S[1]- scale * U[1]
        
        ds = sqrt(S[1])
        du = scale * sqrt(U[1])
        dkorr = sqrt(ds*ds + du*du)
        
        ret.append((S[0], korrektur, dkorr))
    
    return ret


# Szintillator
ug = "Szintillator/untergrund.txt"

write("Szintillator/caesium_bereinigt.txt",
      untergrundbereinigung("Szintillator/caesium.txt", ug))

write("Szintillator/cobalt_bereinigt.txt",
      untergrundbereinigung("Szintillator/cobalt.txt", ug))

write("Szintillator/europium_bereinigt.txt",
      untergrundbereinigung("Szintillator/europium.txt", ug))

# Halbleiter
ug = "Halbleiter/untergrund.txt"

write("Halbleiter/caesium_bereinigt.txt",
      untergrundbereinigung("Halbleiter/caesium.txt", ug))

write("Halbleiter/cobalt_bereinigt.txt",
      untergrundbereinigung("Halbleiter/cobalt.txt", ug))

write("Halbleiter/europium_bereinigt.txt",
      untergrundbereinigung("Halbleiter/europium.txt", ug))

# Langzeitmessung
ug = "untergrund.txt"

write("bodenprobe_bereinigt.txt",
      untergrundbereinigung_skaliert("bodenprobe.txt", ug, 1.0))