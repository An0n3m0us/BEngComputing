#include <iostream>
using namespace std;

void getInput(float &q1, float &q2, float &q3) {
    cout << "Q1 mark: ";
    cin >> q1;
    cout << "Q2 mark: ";
    cin >> q2;
    cout << "Q3 mark: ";
    cin >> q3;
    return;
}

void dispTier(float totalMarks) {
    if (totalMarks > 75) {
        cout << "Tier: Tier 1";
    } else if (totalMarks > 40) {
        cout << "Tier: Tier 2";
    } else {
        cout << "Tier: Tier 3";
    }
    cout << endl;
}

float calcAverage(float combinedTotal, int studentCount) {
    float avgMarks = combinedTotal/studentCount;
    return (int)avgMarks;
}

void dispSummary(float totalMarks) {
    cout << "\n" << "--- SUMMARY ---" << "\n";
    cout << "Total marks: " << (int)totalMarks << "\n";
    dispTier(totalMarks);
}

int main() {
    int lowestMark = 100;
    int highestMark = 0;
    int studentCount = 0;
    float combinedTotal = 0;
    string lowestMarkStudent, highestMarkStudent;

    while(true) {
        float q1, q2, q3;
        float totalMarks;
        string studentName;

        cout << "\n" << "--- DATA ---" << "\n";
        cout << "Name: ";

        cin.ignore();
        getline(cin, studentName);

        if (studentName != "") {
            studentCount++;

            getInput(q1, q2, q3);

            totalMarks = (q1/100*35)+(q2/100*25)+(q3/100*40);
            combinedTotal += totalMarks;
            dispSummary(totalMarks);

            if (totalMarks > highestMark) {
                highestMark = totalMarks;
                highestMarkStudent = studentName;
            }
            if (totalMarks < lowestMark) {
                lowestMark = totalMarks;
                lowestMarkStudent = studentName;
            }
        } else {
            cout << "\n\n";
            cout << "--- Result analysis ---\n";
            cout << "Lowest Mark: " << lowestMark << "\n";
            cout << "Highest Mark: " << highestMark << "\n";
            cout << "Average for " << studentCount << " students: " << calcAverage(combinedTotal, studentCount) << endl;
            break;
        }
    }

    cout << endl;
    return 0;
}