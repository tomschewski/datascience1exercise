def merge_sort(arr):
    # Base case: If the array has more than one element
    if len(arr) > 1:
        mid = len(arr) // 2

        # Split the array into two halves
        left = arr[:mid]
        right = arr[mid:]

        # Recursively sort the left and right halves
        merge_sort(left)
        merge_sort(right)

        # Merge the sorted halves back into the original array
        left_index = right_index = arr_index = 0

        while left_index < len(left) and right_index < len(right):
            # Compare elements from the left and right halves
            if left[left_index] <= right[right_index]:
                arr[arr_index] = left[left_index]
                left_index += 1
            else:
                arr[arr_index] = right[right_index]
                right_index += 1
            arr_index += 1

        # Copy the remaining elements from the left half, if any
        while left_index < len(left):
            arr[arr_index] = left[left_index]
            left_index += 1
            arr_index += 1

        # Copy the remaining elements from the right half, if any
        while right_index < len(right):
            arr[arr_index] = right[right_index]
            right_index += 1
            arr_index += 1


import matplotlib.pyplot as plt

# Original list
original_list = [54, 26, 93, 17, 77, 31, 44, 55, 20]
x = range(len(original_list))
plt.plot(x, original_list)
plt.show()

# Sort the list using merge sort
merge_sort(original_list)

# Sorted list
x = range(len(original_list))
plt.plot(x, original_list)
plt.show()