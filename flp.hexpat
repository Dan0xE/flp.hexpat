#pragma author Dan0xE
#pragma description FruityLoops FLP file format

#pragma MIME application/x-fl-studio-project
#pragma endian little  

// Reference: https://github.com/andrewrk/PyDaw

import std.sys;

struct Header {
    char magic[4];   
    u32 size;         
    u16 format;      
    u16 num_channels; 
    u16 ppq;         
};

struct DataChunk {
    char magic[4];    
    u32 size;        
};

Header header @ 0x00;
DataChunk data_chunk @ sizeof(Header);

std::assert(header.magic == "FLhd", "Invalid FLP header!");
std::assert(header.size == 6, "Invalid header size!");
std::assert(data_chunk.magic == "FLdt", "Invalid data chunk!");
std::assert(header.format == 0, "Invalid format - must be 0 for full songs!");
std::assert(header.ppq > 0, "Invalid PPQ value!");
