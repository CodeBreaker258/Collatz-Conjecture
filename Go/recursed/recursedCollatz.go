package main

import "fmt"
//Main function
func main() {
	//defining needed variables
	var j int
	var comp int
	
	//Creating Arrays needed
	PosArray :=[]int{0,0,0,0,0,0,0,0,0,0};
	StepsArray := []int{0,0,0,0,0,0,0,0,0,0}
	//Major Loop needed to run through 1 to 5 billion
	for j = 1; j<=5000000000;j++{
		comp = collatz(j) //Calls the Collatz Function

		//If the new step number is greater than the first element of the array and the new number isnt in the array
		if(comp > StepsArray[0] && (!(inArray(comp, StepsArray)))){
			PosArray[0]=j //Add to the position array
			StepsArray[0]=comp //Adds the item to the new array
		}
		bubblesort(StepsArray, PosArray) //Calls the bubble sort method
	}
	//Prints the arrays based on the sorting of the steps
	fmt.Println(PosArray) 
	fmt.Println(StepsArray)
	fmt.Println("                            ")
	//Resorts the array based on the magnitude of the position
	bubblesort(PosArray, StepsArray)
	//Prints the items based on new sort
	fmt.Println(PosArray)
	fmt.Println(StepsArray)
}

//Collatz Sequence Calculations
func collatz(i int) int {
	var csteps int //Step counter
	for i != 1{			//While the value doesn't equal one
		if i%2 == 1 {   //If it is odd
			i = (3*i)+1
			csteps = 1 +collatz(i)
		}else{
			i = i / 2	//If the item is even
			csteps = 1 + collatz(i)
		}
	}
	return csteps //Returns the # of steps
}
func bubblesort(a []int, b[]int){   //a is primary array, b is secondary array
    for itemCount := len(a) - 1; ; itemCount-- { //sets itemCount equal to the length of the desired array
        hasChanged := false //Condition to see if the items have swapped
        for index := 0; index < itemCount; index++ { //Cycles through the length of the array
            if a[index] > a[index+1] {
				a[index], a[index+1] = a[index+1], a[index] //Swaps values of the primary array
				b[index],b[index+1] = b[index+1], b[index] //swaps values of secondary array
                hasChanged = true
            }
        }
        if hasChanged == false { //Conditional to see if the value has changed
            break
        }
    }
}
func inArray(newNum int, CStepsArray []int) bool{	
	var i int 
	var size int = len(CStepsArray) //Value is based on size of the array
	for i = 0; i<size; i++{
		if(CStepsArray[i]== newNum){   //If the item in the array is equal to the number presented
			return true
		}
		} //else//
		return false
	}

