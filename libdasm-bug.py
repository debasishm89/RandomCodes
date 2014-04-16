import pydasm

print '''Actual Instructions (Disassembly taken from Immunity debugger)

00433441  |. 3956 38        CMP DWORD PTR DS:[ESI+38],EDX
00433444  |. 0F8E 1E010000  JLE 0x00433568
0043344A  |> 8BBD E4EBFFFF  /MOV EDI,DWORD PTR SS:[EBP-141C]

'''

print 'Pydasm Output Below:\n\n'

buffer = '\x39\x56\x38\x0F\x8E\x1E\x01\x00\x00\x8B\xBD\xE4\xEB\xFF\xFF'
offset = 0
while offset < len(buffer):
	i = pydasm.get_instruction(buffer[offset:], pydasm.MODE_32)
	print pydasm.get_instruction_string(i, pydasm.FORMAT_INTEL, 0)
	if not i:
		break
	offset += i.length

'''
Above prog. out put will be :

cmp [esi+0x38],edx
jng 0x124
mov edi,[ebp-0x141c]

As well as Libdasm produce the same: 

debasish@debasish ~/Downloads/libdasm-beta/examples $ hexdump test.bin 
0000000 5639 0f38 1e8e 0001 8b00 e4bd ffeb 00ff
000000f
debasish@debasish ~/Downloads/libdasm-beta/examples $ ./das test.bin 
00000000  395638            cmp [esi+0x38],edx
00000003  0f8e1e010000      jng 0x127
00000009  8bbde4ebffff      mov edi,[ebp-0x141c]
debasish@debasish ~/Downloads/libdasm-beta/examples $

'''
print ' [+] You can see, in third line libdasm misinterprets the jle (Jump if less or equal ) instruction to jng (Jump if not greater).'
