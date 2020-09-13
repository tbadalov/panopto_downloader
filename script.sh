#!/bin/bash
lecture_url_root=$2
slides_url_root=$3
number_of_pieces=$1
dry_mode=$4 || false
lecture_output_dir="./lecture"
slide_output_dir="./slides"
mkdir -p $lecture_output_dir
mkdir -p $slide_output_dir
for i in $(seq 0 $number_of_pieces); do
	printf -v lecture_piece_url "%s/%05d.ts" $lecture_url_root $i
	printf -v slide_piece_url "%s/%05d.ts" $slides_url_root $i
	
	echo "Downloading piece #" $i
	echo ""

	echo -e "\tDownloading lecture piece..."
	if [ "$dry_mode" = true ]; then
		echo -e "\tDownloading ${lecture_piece_url} to ${lecture_output_dir}"
	else
		wget -P $lecture_output_dir $lecture_piece_url
	fi

	echo -e "\tLecture piece download completed"
	echo ""
	
	echo -e "\tDownloading slide piece..."
	if [ "$dry_mode" = true ]; then
                echo -e "\tDownloading ${slide_piece_url} to ${slide_output_dir}"
        else
		wget -P $slide_output_dir $slide_piece_url
	fi

	echo -e "\tSlide piece download complete"
	echo ""

	echo "${i}/${number_of_pieces} Done"
	echo "------------------"
done

echo "Gluing pieces together for lectures"
find $lecture_output_dir -type f -exec file -N -i -- {} + | sed -n 's!: application/[^:]*$!!p' | sort | xargs -n 1 -I {} cat {} >> full_lecture.ts
echo "Full lecture is in the file full_lecture.ts"
echo ""

echo "Gluing pieces together for slides"
find $slide_output_dir -type f -exec file -N -i -- {} + | sed -n 's!: application/[^:]*$!!p' | sort | xargs -n 1 -I {} cat {} >> full_lecture_slides.ts
echo "Full lecture slide recording is in the file full_lecture_slides.ts"

