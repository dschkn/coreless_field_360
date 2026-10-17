# CORELESS FIELD / 360

**Dmitrii Shchukin · 2026**  
**Sonderprojekt für den neuen Pavillon der Kompositionsklasse von Prof. Oliver Schneller**  
Robert Schumann Hochschule Düsseldorf

*Magnetfeldtopologie · Generative Geometrie · Räumliche Komposition · 3D-Sonifikation*

## Projekt und Konzept

**Coreless Field / 360** ist ein räumliches audiovisuelles Projekt, das die Visualisierung und Sonifikation der Topologie magnetischer Felder untersucht. Ausgangspunkte sind die Arbeiten von **Lodewijk Woltjer** zur magnetischen Helizität (1958), **H. Keith Moffatt** über die topologische Verknüpfung von Wirbellinien (1969) und **J. Brian Taylor** über die magnetische Relaxation (1974; 1986).

Im Mittelpunkt steht eine räumliche Struktur aus verflochtenen Feldlinien und Flussröhren: ein kontinuierliches Gefüge **ohne zentralen Kern**. Krümmung, Rotation, lokale Dichte und Verknüpfung werden als geometrische Eigenschaften sichtbar und als kompositorische Parameter interpretierbar.

Für den neuen Pavillon der Kompositionsklasse ist ein **eigens konzipiertes 32-Lautsprecher-Spatialisationssystem** vorgesehen. Die visuelle Feldstruktur und die dreidimensionale Klangprojektion sind zwei Wahrnehmungsformen derselben kompositorischen Idee: Topologische Beziehungen werden in Bewegung, Frequenz, spektrale Dichte und räumliche Energieverteilung übersetzt.

> **Konzept und Implementierung:** Woltjer, Moffatt und Taylor liefern die wissenschaftlichen Bezugspunkte. Die gegenwärtige Max/MSP/Jitter-Version verwendet eine eigens generierte, feldähnliche Geometrie; sie löst noch keine magnetohydrodynamischen Feldgleichungen. Die unten beschriebenen Kopplungen sind das Modell für die geplante Sonifikation, nicht bereits vollständig implementierte Analysegrößen.

## Theoretische Grundlagen

### 1. Magnetische Helizität — Lodewijk Woltjer (1958)

Magnetische Helizität beschreibt die globale Verknüpfung und Verdrillung magnetischer Feldlinien. Mit dem Vektorpotential **A** und dem Magnetfeld **B** = ∇ × **A**:

\[
H=\int_V \mathbf A\cdot\mathbf B\,dV
\]

Unter geeigneten Randbedingungen und in der idealen Magnetohydrodynamik bleibt diese Größe erhalten. Sie liefert einen Bezugspunkt für die Idee einer deformierbaren, aber topologisch organisierten räumlichen Struktur.

### 2. Verschlingung und Verknotung — H. Keith Moffatt (1969)

Moffatt untersuchte den topologischen Verknüpfungsgrad von Wirbellinien und seine Beziehung zu Integralinvarianten. Für zwei dünne, geschlossene magnetische Flussröhren lautet der **gegenseitige Beitrag** zur Helizität:

\[
H_{\mathrm{mutual}}=2\,Lk_{12}\,\Phi_1\Phi_2
\]

Hier bezeichnet \(Lk_{12}\) die Verknüpfungszahl und \(\Phi_1,\Phi_2\) die magnetischen Flüsse. Die gesamte Helizität kann zusätzlich Eigenbeiträge durch Twist und Writhe enthalten. Die kompositorische Frage lautet: **Wie werden Verknüpfungen und räumliche Beziehungen zwischen Linien hörbar?**

### 3. Magnetische Relaxation — J. Brian Taylor (1974; 1986)

Taylors Relaxationsprinzip beschreibt ein magnetisches System, das unter näherungsweiser Erhaltung der globalen Helizität einen energieärmeren Zustand erreicht. Als Variationsprinzip:

\[
\delta\!\left(E-\lambda H\right)=0
\]

Für einen entsprechenden relaxierten Zustand ergibt sich ein kraftfreies Feld:

\[
\nabla\times\mathbf B=\alpha\mathbf B,\qquad
\nabla\cdot\mathbf B=0
\]

Dabei ist \(\alpha\) im idealisierten Taylor-Zustand räumlich konstant. Für **Coreless Field / 360** wird Relaxation als dramaturgisches Prinzip aufgegriffen: dichte, komplexe Konfigurationen können in andere räumliche Verteilungen und Bewegungszustände übergehen.

## Geometrie und Feldlinien

Eine räumliche Mittellinie \(\mathbf r(s)\) lässt sich als Überlagerung von Kurvenanteilen modellieren, beispielsweise:

\[
\mathbf r(s)=\sum_{n=1}^{N} A_n\sin(k_n s+\varphi_n)\,\mathbf e_n
\]

Um diese Kurve wird mit lokalem Radius \(a(s)\) und den beiden Querschnittsrichtungen \(\mathbf e_1(s)\), \(\mathbf e_2(s)\) eine Oberfläche erzeugt:

\[
\mathbf X(s,\phi)=\mathbf r(s)+a(s)
\left[\cos\phi\,\mathbf e_1(s)+\sin\phi\,\mathbf e_2(s)\right]
\]

\[
s\in[0,L],\qquad\phi\in[0,2\pi]
\]

Die Oberflächenmetrik lautet:

\[
g_{ij}=\partial_i\mathbf X\cdot\partial_j\mathbf X
\]

Für eine tatsächliche Magnetfeldlösung folgen Feldlinien der lokalen Feldrichtung:

\[
\frac{d\mathbf r}{ds}=
\frac{\mathbf B(\mathbf r)}{\lVert\mathbf B(\mathbf r)\rVert}
\]

Diese Gleichung unterscheidet die physikalische Feldlinie von der frei gestalteten parametrischen Kurve in der aktuellen Visualisierung.

## Räumliche Sonifikation

Die künstlerische Übersetzung der Feldgeometrie in Klang sieht vier miteinander verbundene Zuordnungen vor:

| Geometrische Eigenschaft | Kompositorische Entsprechung |
| --- | --- |
| Krümmung und Verlauf der Linien | Kontinuierliche Klangtrajektorien und Bewegungsgeschwindigkeit |
| Lokale Liniendichte | Spektrale Verdichtung und Verteilung von Klangenergie |
| Rotation, Twist und Verknüpfung | Umlaufende, mehrschichtige Bewegungen |
| Relaxation und räumliche Reorganisation | Zeitliche Formentwicklung und Übergänge zwischen Bewegungszuständen |

Das **32-Lautsprecher-System** ist die vorgesehene pavillonspezifische räumliche Umsetzung. Die tatsächliche Lautsprechergeometrie, Mehrkanal-Ausgabe und Raumkalibrierung gehören zur Umsetzung vor Ort.

## Max/MSP / Jitter — aktuelle Version 0.6

Die bisherige Softwarefassung ist ein eigenständiger audiovisueller Prototyp zur Untersuchung von Feldformen und räumlichen Bewegungen.

- **Geometrie:** fünf ineinander verschränkte, deformierbare Drahtkörper; eine goldfarbene Kurve und sichtbare Positionen virtueller Schallquellen.
- **Vorschau-Layout:** standardmäßig **36 virtuelle Lautsprecher** in fünf Höhenebenen (1 + 7 + 10 + 10 + 8), konfigurierbar für **2 bis 40**.
- **Klang:** tiefe Sinustöne, Schwebungen, langsame Höhenbewegungen und räumliche Übergänge in einer rund **15-minütigen** Zeitstruktur.
- **Ausgabe:** virtuelle kanalweise Pegel und eine **Stereo-Abhörfassung**. Die aktuelle Winkelgewichtung ist **kein VBAP** und keine kalibrierte 32-Kanal-Ausspielung.
- **Feldberechnung:** die dargestellte Struktur ist ein generatives geometrisches Modell; die magnetische Helizität und die Relaxationsgleichungen werden im aktuellen Patch nicht numerisch berechnet.

### Installation und Start

1. **Max/MSP mit Jitter** installieren.
2. \`coreless_field_360_v06.maxpat\` und \`coreless_field.js\` in demselben Verzeichnis ablegen.
3. Den Patch öffnen, zunächst die Abhörlautstärke niedrig einstellen und **RUN** aktivieren.
4. Bei Bedarf mit **RESET** die 15-minütige Zeitstruktur neu starten.

Die Dateien \`coreless_field_360_v04.maxpat\` und \`coreless_field_360_v05.maxpat\` bleiben als frühere Versionen erhalten. Der neue Patch und die Signalverbindungen müssen in einer tatsächlichen Max/Jitter-Umgebung vollständig getestet werden.

### Formverlauf der aktuellen Hörfassung

| Zeit | Abschnitt | Klangliche Bewegung |
| --- | --- | --- |
| 0:00–2:00 | Ground | Tiefer Grundton (ca. 47 Hz), Schwebungen, Bewegung auf der unteren Ebene |
| 2:00–5:00 | Ascension | Allmählicher Aufstieg der virtuellen Quelle |
| 5:00–7:00 | Zenith | Hohe Position, kleine Bewegungen und Schwebungen |
| 7:00–10:00 | Descent | Absteigende Spiralbewegung |
| 10:00–12:15 | Instability | Zunehmende Bewegung und Verstimmung |
| 12:15–15:00 | Return | Beruhigung und Rückkehr zur unteren Ebene |

## Wissenschaftliche Bezugspunkte

1. **Woltjer, L.** (1958). *A Theorem on Force-Free Magnetic Fields*. **Proceedings of the National Academy of Sciences**, 44(6), 489–491. [Volltext](https://pmc.ncbi.nlm.nih.gov/articles/PMC528606/).
2. **Moffatt, H. K.** (1969). *The Degree of Knottedness of Tangled Vortex Lines*. **Journal of Fluid Mechanics**, 35(1), 117–129. [PDF](https://www.damtp.cam.ac.uk/user/hkm2/PDFs/Moffatt_1969_JFM_35_117.pdf).
3. **Taylor, J. B.** (1974). *Relaxation of Toroidal Plasma and Generation of Reverse Magnetic Fields*. **Physical Review Letters**, 33, 1139–1141. [DOI](https://doi.org/10.1103/PhysRevLett.33.1139).
4. **Taylor, J. B.** (1986). *Relaxation and Magnetic Reconnection in Plasmas*. **Reviews of Modern Physics**, 58, 741–763. [DOI](https://doi.org/10.1103/RevModPhys.58.741).

---

**Dmitrii Shchukin · 2026**  
*Open structures. Continuous fields. No core.*
