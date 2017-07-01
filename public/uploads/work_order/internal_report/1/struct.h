
typedef struct {
  uint8_t   jump_code[3];
  uint8_t   oem_file_system[8];
  uint8_t   must_be_zero[35];
  uint8_t   zero[18];
  uint8_t   partition_sector_offset[4];
  uint8_t   zero2[4];
  uint8_t   total_sector_volumen[8]; 
  uint8_t   fat_location_sector[4];   
  uint8_t   physical_size_fat_sector[4];
  uint8_t   physical_sector_location_bitmap[4];
  uint8_t   allocation_units_volumen[4];
  uint8_t   first_cluster_root_directory[4]; //LSEEK 
  uint8_t   volumen_serial_number[4];
  uint8_t   file_system_revision_number[2];
  uint8_t   volumen_flags[4];
  uint8_t   active_fat;
  uint8_t   bytes_per_sector;
  uint8_t   sectors_per_cluster;
  uint8_t   number_fat_volumen;
  uint8_t   percentage_in_use;
} first_sector;
  
typedef struct 
{
	uint8_t entry_record;
	uint8_t number_32_records_entry;
	uint8_t file_name_checksum[2];
	uint8_t dos_file_flags[2];
	uint8_t unknown_volumen[2];
	uint8_t create_date_time[4];
	uint8_t last_access_date_time[4];
	uint8_t last_modified_date_time[4];
	uint8_t unknown[4];
	uint8_t time_zone_offset[3];

} directory_entry_record;

typedef struct 
{
	uint8_t record_type;
	uint8_t name_space_type;
	uint8_t number_of_unicode[2];
	uint8_t file_name_hash[2];
	uint8_t unknown[2];
	uint8_t logical_size_file_bytes[8];
	uint8_t unknown2[4];
	uint8_t starting_cluster_file[4];
	uint8_t logical_size_of_file_byte[8];
} stream_extension;

typedef struct 
{
	uint8_t record_type;
	uint8_t file_name[4];
}file_name_extension;

typedef struct
{
	directory_entry_record directory;
	stream_extension stream;
	file_name_extension file_name;
	
} file_record_types;
