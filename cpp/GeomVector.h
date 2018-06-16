
#include "utils.h"
#include "array.h"

namespace ods {

class GeomVector {
protected:
	array<int> x;

public:	
	unsigned hashCode() {
		long p = (1L<<32)-5;   // 2^32 - 5 は素数
		long z = 0x64b6055aL;  // random.org から取得した 32 ビットの乱数
		int z2 = 0x5067d19d;   // 32 ビットのランダムな奇数
		long s = 0;
		long zi = 1;
		for (int i = 0; i < x.length; i++) {
			// 31 ビットに縮める
			long long xi = (ods::hashCode(x[i]) * z2) >> 1; 
			s = (s + zi * xi) % p;
			zi = (zi * z) % p;	
		}
		s = (s + zi * (p-1)) % p;
		return (int)s;
	}
};

} // namespace ods
